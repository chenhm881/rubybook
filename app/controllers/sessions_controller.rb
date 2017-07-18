class SessionsController < ApplicationController
  skip_before_action :require_login
  include SessionsHelper
  def create
    email = params[:session][:email].downcase
    user = User.where("email = :email", email: email).first
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to notes_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
