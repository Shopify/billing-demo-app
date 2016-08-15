class RecurringApplicationChargesController < AuthenticatedController

  before_action :load_current_recurring_charge

  def show
  end

  def create
    @recurring_application_charge.try!(:cancel)

    @recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.new(recurring_application_charge_params)
    @recurring_application_charge.test = true
    @recurring_application_charge.return_url = callback_recurring_application_charge_url

    if @recurring_application_charge.save
      fullpage_redirect_to @recurring_application_charge.confirmation_url
    else
      flash[:danger] = @recurring_application_charge.errors.full_messages.first.to_s.capitalize
      redirect_to_correct_path(@recurring_application_charge)
    end
  end

  def customize
    @recurring_application_charge.customize(params[:recurring_application_charge])
    fullpage_redirect_to @recurring_application_charge.update_capped_amount_url
  end

  def callback
    @recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.find(params[:charge_id])
    if @recurring_application_charge.status == 'accepted'
      @recurring_application_charge.activate
    end

    redirect_to_correct_path(@recurring_application_charge)
  end

  def destroy
    @recurring_application_charge.cancel

    flash[:success] = "Recurring application charge was cancelled successfully"

    redirect_to_correct_path(@recurring_application_charge)
  end

  private

  def load_current_recurring_charge
    @recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.current
  end

  def recurring_application_charge_params
    params.require(:recurring_application_charge).permit(
      :name,
      :price,
      :capped_amount,
      :terms,
      :trial_days
    )
  end

  def redirect_to_correct_path(recurring_application_charge)
    if recurring_application_charge.try(:capped_amount)
      redirect_to usage_charge_path
    else
      redirect_to recurring_application_charge_path
    end
  end

end
