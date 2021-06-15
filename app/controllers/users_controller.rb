class UsersController < ApplicationController
  def hovercard
    @user = User.find_by(username: params[:username])
    render layout: false
  end
end