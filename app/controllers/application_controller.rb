class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def check_password
    unless Admin.authenticate(params[:password])
      flash[:error] = "Incorrect password for deletion"
      redirect_to post_path
      return false
    else
      return true
    end
  end
end
