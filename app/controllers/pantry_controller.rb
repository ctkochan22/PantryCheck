class PantryController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(id: current_user.id)
    @pantry = Pantry.find_by(id: params[:id])
  end

  def new
  end

  def create
    user = User.find_by(id: current_user.id)
    pantry = Pantry.new(name: pantry_params[:name], is_private: false)
    if pantry.save
      user.update(pantry_id: pantry.id)
      redirect_to pantry_path(pantry.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  private

  def pantry_params
    params.require(:pantry).permit(
      :name
    )
  end
end
