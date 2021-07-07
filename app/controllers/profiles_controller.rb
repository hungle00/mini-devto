class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  
  def show
  end

  def following
    @title = "Following"  
    @users = @user.followeds
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers
    render 'show_follow'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end
end