class UsersController<ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Please enter a number between 1-5"
      render :new
    end
  end

  def show
    @user = current_user
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
