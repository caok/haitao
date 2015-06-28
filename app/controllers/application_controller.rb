class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :init_uid, if: :should_init_uid?

  private
  def should_init_uid?
    current_user.blank? and cookies[:uid].blank?
  end

  def init_uid
    cookies.permanent[:uid] = generate_uid
  end

  def generate_uid
    SecureRandom.hex(5).to_s + DateTime.now.to_i.to_s + request.remote_ip.gsub('.', '')
  end
end
