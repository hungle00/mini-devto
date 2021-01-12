class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @followers_count = @user.followers.count
    @followeds_count = @user.followeds.count
  end
end