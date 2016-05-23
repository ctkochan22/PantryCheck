class IngredientController < ApplicationController

  def new
    @categories = Ingredient.categories_array
    @storage_types = Ingredient.storage_types_array
  end

  def create
    redirect_to action: 'finish', name: ingredient_params[:name], category: ingredient_params[:category], storage_type: ingredient_params[:storage_type]
  end

  def finish
    @package = params
    @bsc_storage = Ingredient.bsc_storage
  end

  def complete
    user = User.find_by(id: current_user)
    ingredient = Ingredient.new(amount_params)
    ingredient[:pantry_id] = user.pantry_id
    if ingredient.save
      redirect_to user_path(current_user.id)
    else
      redirect_to new_ingredient_path
    end
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
      :name,
      :category,
      :storage_type,
      :amount
      )
  end
end
