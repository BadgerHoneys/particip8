class SessionsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  #do not invoke the authenticate_request method before session creation.
  skip_before_action :authenticate_request

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by(email: params[:email])
    password = params[:password]

    #TODO: redo this authentication method
    if user && user.match_password(password)
      render json: { auth_token: user.generate_auth_token }
    else
      #401 status will indicate lack of authentication
      render :nothing => true, status: 401
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
  end

#  private
#
#    def set_user
#      @user = User.find(params[:id])
#    end
#
#    def user_params
#      params.require(:user).permit(:first_name, :last_name, :email)
#    end

end
