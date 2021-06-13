class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find_by(username: params[:username])
    #@user = User.find(params[:id])
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