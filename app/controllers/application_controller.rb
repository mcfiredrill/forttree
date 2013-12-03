class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile

  private

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
  end
end
