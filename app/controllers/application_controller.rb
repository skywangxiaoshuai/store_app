class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  # 登入指定的用户
  def log_in(user)
    session[:user_id] = user.id
  end

  # 返回当前用户（如果有的话）
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # 判断用户是否已经登录，如果登录返回true，没有登录则返回false
  def logged_in?
    !current_user.nil?
  end

  private

  #返回当前购物车,如果没有的则新建一个
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create(user_id: current_user.id)
    session[:cart_id] = cart.id
    cart
  end

  #确保用户已经登录
  def logged_in_user
    unless logged_in?
      flash[:danger] = '请先登录！'
      redirect_to login_url
    end
  end
end
