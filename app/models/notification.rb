class Notification < ApplicationRecord
  belongs_to :user

  TYPES = %w{ created updated liked }

  after_initialize :set_defaults

  validates :notification_type, :title, presence: true
  validates :notification_type, inclusion: { in: TYPES }

  def set_defaults
    self.notification_type ||= TYPES.first
  end
end
