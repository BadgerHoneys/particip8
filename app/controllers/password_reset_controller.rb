class PasswordResetController < ApplicationController

  #do not invoke the authenticate_request method before session creation.
  skip_before_action :authenticate_request

  def create
    #find the user by email
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!

      #TODO: deliver email to user

      #replace this in the future
      render json: {password_reset_token: user.password_reset_token}
    else
      render json: params, status: :unauthorized
    end
  end

  def show
    @user = User.find_by(password_reset_token: params[:id])
    render :json => @user
  end

  def update
    #find the user by their password_reset_token
    @user = User.find(params[:id])

    if @user && params[:user][:password].eql?(params[:user][:password_confirmation])
      if @user.update_attributes(user_params)
        
        @user.encrypt_password

        @user.update_attributes({:password_reset_token => nil})
        render :nothing => true
      end
    end   
  end

  def user_params
    #TODO: replace this to require user
    #params.require(:user).permit(:password, :password_confirmation)
    params.require(:user).permit(:password)
  end
end

