class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_login
  skip_before_action :verify_authenticity_token, if: :json_request?

  def require_login
  	unless signed_in?

  		flash[:error] = "Your must be logged in to access this section"
  		redirect_to new_session_url

  	end
  end

  protected
  def json_request?
    request.format.json?
  end

end
