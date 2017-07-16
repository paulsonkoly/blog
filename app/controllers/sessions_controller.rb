class SessionsController < ApplicationController
  skip_authorization_check
  
  def new
  end

  def create    
    user = User.find_by(name: sessions_params[:user_name])    
    if user && user.authenticate(sessions_params[:user_password])
      login user
      redirect_to root_url
    else
      flash.now[:alert] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  private

  def sessions_params
    params.require(:session).permit(:user_name, :user_password)
  end
end
