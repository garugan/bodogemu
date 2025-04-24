class SessionsController < ApplicationController
  def guest_login
    user = User.guest
    sign_in user
    redirect_to user_path notice: 'ゲストユーザーとしてログインしました。'
  end
end
