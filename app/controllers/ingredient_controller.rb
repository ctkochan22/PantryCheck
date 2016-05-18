class IngredientController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(id: current_user)

  end




  private

  def ingredient_params
    params.require(:ingredient).permit(
        :name,
        :category,
        :storage_type
      )
  end

  def amount_params
    params.require(:ingredient).permit(
      :amount
      )
  end
end
