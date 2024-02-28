class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  #ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
    flash[:danger] = "権限がありません。"
  end
end
