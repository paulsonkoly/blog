class SessionsController < ApplicationController
  def new
  end

  def create    
    user = User.find_by(name: sessions_params[:user_name])    
    if user.authenticate(sessions_params[:user_password])
      helpers.login user
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
    helpers.logout
    redirect_to root_url
  end

  private

  def sessions_params
    params.require(:session).permit(:user_name, :user_password)
  end
end
