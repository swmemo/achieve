class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @followed_user = @user.followed_users  # フォローしている人が取得できる
    @follower = @user.followers      # フォロワーが取得できる。
  end
  
end
