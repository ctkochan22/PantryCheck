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
    @user = User.find_by(id: current_user.id)
    @pantry = Pantry.find_by(id: @user.pantry_id)
    if params[:category] == nil
      @ingredients = Ingredient.where(pantry_id: @user.pantry_id).order(:name)
    else
      @ingredients = Ingredient.where(pantry_id: @user.pantry_id, category: params[:category]).order(:name)
    end
    @categories = Ingredient.categories_array
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

