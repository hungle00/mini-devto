class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    #@followers_count = @user.followers.count
    #@followeds_count = @user.followeds.count
  end

  def following
    @title = "Following"
    @user = User.find_by(username: params[:username])
    @users = @user.followeds
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find_by(username: params[:username])
    @users = @user.followers
    render 'show_follow'
  end
end