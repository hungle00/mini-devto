class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true, allow_blank: false

  after_create_commit do
    notify_user
    broadcast_append_to :comments, target: "comments", partial: "comments/comment", locals: { comment: self }
  end

  after_update_commit do
    broadcast_update_to :comments, partial: "comments/comment", locals: { comment: self }
  end

  after_destroy_commit do
    broadcast_remove_to :comments
  end
  
  def notify_user
    CommentNotification.with(comment: self).deliver(self.article.user)
  end
end
