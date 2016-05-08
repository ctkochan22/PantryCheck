class UserController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to new_user_path
    end
  end

  def show
    puts "********"
    puts params
  end


  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone_number,
      :password
      )
  end
end

