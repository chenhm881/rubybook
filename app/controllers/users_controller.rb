class UsersController < ApplicationController
  include SessionsHelper
  skip_before_action :require_login
  def new
    @user = User.new
  end

  def show
    require_login
    @user = User.find(params.require(:id))
  end

  def edit
    require_login
    @user = User.find(params.require(:id))
  end

  def create
    require_login
    @user=User.new(user_params)
    byebug
    if @user.save
      respond_to do |format|
        format.html {redirect_to @user,
          notice: 'User was successfully created.' }
        format.json {render action: 'show', status: :created, location: @user}

      end
    else
      respond_to do |format|
        format.html {render action: 'new'}
        format.json {render json: @user.errors,
          status: :unprocessable_entity}
      end
    end
  end

  def update
    require_login
    @user = User.find(params.require(:id))
    respond_to do |format|
       if @user.update_attributes(user_params)
          format.html {redirect_to @user,
            notice: 'User was successfully updated.'}
          format.json {render json: @user.errors,
            status: :unprocessable_entity}
       else
          format.html {render action: 'edit'}
          format.json {render json: @user.errors,
           status: :unprocessable_entity}
       end
    end
  end

  private
   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
