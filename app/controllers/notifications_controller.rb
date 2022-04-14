class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user)
  end

  def read_all
    Notification.where(recipient: current_user).mark_as_read!
    redirect_to notifications_path, notice: "Marked all as read"
  end
end
