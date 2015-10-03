class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # we will be handling authentication for our requests by validating against a session token
  # protect_from_forgery with: :exception
end
