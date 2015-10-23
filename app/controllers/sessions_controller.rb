class SessionsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by(email: params[:email])
    password = params[:password]

    #TODO: redo this authentication method
    if user && (user.password.eql? password)
      #set the session_id
      session[:user_id] = user.id
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
