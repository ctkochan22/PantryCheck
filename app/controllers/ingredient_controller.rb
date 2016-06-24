class IngredientController < ApplicationController

  def show
  end

  def new
    @categories = Ingredient.categories_array
    @storage_types = Ingredient.storage_types_array
  end

  def create
    redirect_to action: 'finish', name: start_params[:name], category: start_params[:category], storage_type: start_params[:storage_type]
  end

  def finish
    @package = params
    @bsc_storage = Ingredient.bsc_storage
  end

  def complete
    user = User.find_by(id: current_user)
    ingredient = Ingredient.new(ingredient_params)
    ingredient[:search_name] = ingredient_params[:name].downcase
    ingredient[:pantry_id] = user.pantry_id
    if ingredient.save
      redirect_to user_path(current_user.id)
    else
      redirect_to new_ingredient_path
    end
  end

## Amount Update
  def edit_amount
    @ingredient = Ingredient.find_by(id: params[:id])
    @bsc_storage = Ingredient.bsc_storage
  end

  def update_amount
    Ingredient.update(amount_params[:id], amount: amount_params[:amount])
    redirect_to user_path(current_user.id)
  end

## Full Update
  def edit
    @categories = Ingredient.categories_array
    @storage_types = Ingredient.storage_types_array
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def update
    ingredient = Ingredient.find_by(id: params[:id])
    ingredient.update_attributes(start_params)
    ingredient.update(search_name: start_params[:name].downcase)
    redirect_to user_path(current_user.id)
  end
##

## Destroy

  def destroy
    puts "**** DESTROY: Ingredient #{params[:id]}"
    ingredient = Ingredient.find_by(id: params[:id])
    if ingredient != nil && ingredient.is_owner(current_user.id)
      puts "*** Deleting #{ingredient}"
      Ingredient.delete(params[:id])
    end
    redirect_to user_path(current_user.id)
  end

  private
  def start_params
    params.require(:ingredient).permit(
        :name,
        :category,
        :storage_type
      )
  end

  def ingredient_params
    params.require(:ingredient).permit(
      :name,
      :category,
      :storage_type,
      :amount
      )
  end

  def amount_params
    params.require(:ingredient).permit(
      :amount,
      :id)
  end

end
