class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by!(username: params[:profile_username])

    if current_user.follow! @user.id
      respond_to do |format|
        format.html { redirect_to profile_path(@user), notice: 'Following user.' }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    @user = User.find_by!(username: params[:profile_username])

    if current_user.unfollow! @user.id
      respond_to do |format|
        format.html { redirect_to profile_path(@user), notice: 'Unfollow user' }
        format.json { head :no_content }
      end
    end
  end
end
