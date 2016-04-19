class SessionsController < ApplicationController

  # def new
  # end

  def create
    @user = User.find_by(username: params[:session][:username])
      if @user.present? && @user.authenticate(params[:session][:password])
        # @user = User.find(session[])
        # set the current session's user_id tp this @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash.now[:error] = "Invalid Login Info"
        render :new
      end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
