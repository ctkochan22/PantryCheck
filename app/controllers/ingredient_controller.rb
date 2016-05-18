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
  end

  def complete
    puts "******"
    puts amount_params
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
