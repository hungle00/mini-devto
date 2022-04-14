class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit do 
    broadcast_to_recipient
    update_counter
  end

  private

  def broadcast_to_recipient
    broadcast_prepend_later_to(
      recipient,
      :notifications,
      target: 'notifications-list',
      partial: 'shared/notification',
      locals: { notification: self }
    )
  end

  def update_counter
    broadcast_update_to(
      recipient, :notifications_counter, target: "notifications_counter",
      html: Notification.where(recipient: recipient).count
    )
  end
end
