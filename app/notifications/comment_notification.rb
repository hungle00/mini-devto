# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :comment

  # Define helper methods to make rendering easier.
  #
  def message
    "#{params[:comment].user.username} created new comment: #{params[:comment].body}"
  end
  
  def url
    article_path(params[:comment].article)
  end
end
