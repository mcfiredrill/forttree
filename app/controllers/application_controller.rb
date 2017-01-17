class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :prepare_for_mobile

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

  def setup_negative_captcha
    @captcha = NegativeCaptcha.new(
      # A secret key entered in environment.rb. 'rake secret' will give you a good one.
      secret: ENV['NEGATIVE_CAPTCHA_SECRET'],
      spinner: request.remote_ip,
      # Whatever fields are in your form
      fields: [:name, :content, :photo],
      params: params,
      message: "X__x"
    )
  end
end
