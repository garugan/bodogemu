class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @reviews = Review.all
  end

  def guest_login
    user = User.guest
    sign_in user
    redirect_to users_path(user), notice: 'ゲストユーザーとしてログインしました。'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to '/users/sign_up'
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email)
  end

end
