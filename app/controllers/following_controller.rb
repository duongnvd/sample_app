class FollowingController < ApplicationController
  before_action :load_user, on: :following

  def following
    @title = t "following"
    @users = @user.following.page params[:page]
    render "users/show_follow"
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end
end
