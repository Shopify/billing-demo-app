class ApplicationCreditsController < AuthenticatedController

  def show
    @application_credits = ShopifyAPI::ApplicationCredit.all
  end

  def create
    application_credit = ShopifyAPI::ApplicationCredit.new(application_credit_params)
    application_credit.test = true

    if application_credit.save
      flash[:success] = "Application credit was issued successfully"
    else
      flash[:danger] = application_credit.errors.full_messages.to_sentence
    end

    redirect_to application_credit_path
  end

  private

  def application_credit_params
    params.require(:application_credit).permit(
      :description,
      :amount
    )
  end
end
