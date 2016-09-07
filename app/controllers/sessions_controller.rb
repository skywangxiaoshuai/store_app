class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user # 自定义的辅助方法
      redirect_to root_url # redirect_to  user_url(user)
    else
      flash[:danger] = '邮箱或密码错误！'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    session[:cart_id] = nil
    current_user = nil
    redirect_to root_url
  end
end
