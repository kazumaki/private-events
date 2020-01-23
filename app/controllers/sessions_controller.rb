class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user
      session[:user_id] = user.id
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end
end
