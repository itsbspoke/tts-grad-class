module ApplicationHelper
  def formatted_price(amount)
    sprintf("$%0.2f", amount / 100.0)
  end
  def can_haz_rsvp?(event)
    if current_user.nil?
      false
    else
      event.open_to(current_user)
    end
  end
end
