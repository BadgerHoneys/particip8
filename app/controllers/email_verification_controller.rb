class EmailVerificationController < ApplicationController

  #do not invoke the authenticate_request method before email_verification methods.
  skip_before_action :authenticate_request

  def create

    #create a user with expected params 
    @user = User.new(new_user_params)

    if @user.save
      @user.generate_email_verification_token!
    end

    #if the user is an admin, create an associated district as well
    if params[:user][:type] == "Admin"
      district = District.new(name: params[:district_name])
      district.admin = @user
      if district.save
        render json: {email_verification_token: @user.email_verification_token}
      end
    elsif params[:user][:type] == "Teacher"
      render json: {email_verification_token: @user.email_verification_token}
    end
  end


  def show
    @user = User.find_by(email_verification_token: params[:id])
    render :json => @user
  end

  def update
    @user = User.find(params[:id])

    if @user && params[:user][:password].eql?(params[:user][:password_confirmation])
      if @user.update_attributes(user_params)
        @user.encrypt_password
        #wipe the email verification token
        @user.update_attributes({:email_verification_token => nil})
       
        render :nothing => true
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :first_name, :last_name)
  end

  def new_user_params
    params.require(:user).permit(:type, :email, :first_name, :last_name, :school_id)
  end
end
