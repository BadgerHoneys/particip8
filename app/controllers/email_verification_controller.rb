class EmailVerificationController < ApplicationController

  #do not invoke the authenticate_request method before email_verification methods.
  skip_before_action :authenticate_request

  def create
    @admin = Admin.new(email: params[:email])
    if @admin.save
      @admin.generate_email_verification_token!

      #create the district
      district = District.new(name: params[:district_name])
      district.admin = @admin
      
      if district.save
        render json: {email_verification_token: @admin.email_verification_token}
      end
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

  def user_params
    params.require(:user).permit(:password, :first_name, :last_name)
  end
end
