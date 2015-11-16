class PasswordResetController < ApplicationController

  #do not invoke the authenticate_request method before session creation.
  skip_before_action :authenticate_request

  # POST /password_reset/generate_token
  def generate_token
  	email = params[:email]

    #TODO: Implement an email lookup on Users (and index Users.email as well)
    #Render a tailored response in the event that the email does not exist
    #Only proceed with verification_token logic if the email is present in `Users`.

  	#generate a verification token using urlsafe_base64,
  	#ensuring uniqueness amongst email_verification keys
  	verification_token = loop do
  		token = SecureRandom.urlsafe_base64
  		break token unless $redis.exists("Password_Reset_" + token)
  	end

  	verification_key = "Password_Reset_" + verification_token
  	$redis.set(verification_key, email.downcase)

    #TODO: Distribute email with link

  	render json: {token: verification_token}
  end


  # POST /password_reset/verify_token
  def verify_token
  	
  	verification_token = params[:token]
  	verification_key = "Password_Reset_" + verification_token

  	email = $redis.get(verification_key)

  	if email
  		render json: {email: email}
  	else
  		render json: params, status: :unauthorized
  	end
  end
end

