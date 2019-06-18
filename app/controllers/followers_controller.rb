class FollowersController < ApplicationController
  before_action :load_user, only: :index

  def index
    @title = t "followers"
    @users = @user.followers.page params[:page]
    render "users/show_follow"
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end
end
