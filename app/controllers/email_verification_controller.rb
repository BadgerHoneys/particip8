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

  	render json: verification_token, status: 200
  end


  # GET /email_verification/verify_token
  def verify_token
  	#token provided in params
  	binding.pry
  	#lookup in redis using token

  	#response of 200 with email if successful lookup

  	#response of <redirect> if lookup not successful

  end
end

