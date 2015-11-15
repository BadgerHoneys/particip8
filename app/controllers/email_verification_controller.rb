class EmailVerificationController < ApplicationController

  #do not invoke the authenticate_request method before session creation.
  skip_before_action :authenticate_request

  # POST /email_verification/generate_token
  def generate_token
  	email = params[:email]

  	#generate a verification token using urlsafe_base64,
  	#ensuring uniqueness amongst email_verification keys
  	verification_token = loop do
  		token = SecureRandom.urlsafe_base64
  		break token unless $redis.exists("Email_Verification_" + token)
  	end

  	verification_key = "Email_Verification_" + verification_token
  	$redis.set(verification_key, email.downcase)

  	render json: verification_token
  end


  # POST /email_verification/verify_token
  def verify_token
  	
  	verification_token = params[:token]
  	verification_key = "Email_Verification_" + verification_token

  	email = $redis.get(verification_key)

  	if email
  		render json: email
  	else
  		render json: params, status: :unauthorized
  	end
  end
end

