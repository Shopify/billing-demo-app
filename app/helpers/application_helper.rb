module ApplicationHelper
  def show_balance_warning?(charge)
    (charge.balance_used.to_f / charge.capped_amount.to_f) > 0.6
  end

  def balance_used_percentage(charge)
    (charge.balance_used.to_f / charge.capped_amount.to_f) * 100
  end
end
