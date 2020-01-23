class UsersController < ApplicationController
  def new
    redirect_to current_user if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @events = @user.events
    @attending_events = @user.attending_events
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
