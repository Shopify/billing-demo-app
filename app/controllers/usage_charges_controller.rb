class UsageChargesController < AuthenticatedController

  def show
    @recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.current
    @usage_charges = @recurring_application_charge.usage_charges if @recurring_application_charge.try(:capped_amount)
  end

  def create
    usage_charge = ShopifyAPI::UsageCharge.new(params[:usage_charge])
    usage_charge.prefix_options[:recurring_application_charge_id] = ShopifyAPI::RecurringApplicationCharge.current.id

    if usage_charge.save
      flash[:success] = "Usage charge was created successfully"
    else
      flash[:danger] = usage_charge.errors.full_messages.first.to_s.capitalize
    end

    redirect_to usage_charge_path
  end

end
