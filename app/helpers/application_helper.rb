module ApplicationHelper
  include Pagy::Frontend

  def notification_color(notification)
    notification.to_notification.read? ? 'bg-body' : 'bg-light'
  end
end
