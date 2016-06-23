class SearchController < ApplicationController

  def show
    regex = "(.|)#{params[:search_term]}(.|)"
    term = Regexp.new(regex)
    @ingredients = Ingredient.where(pantry_id: current_pantry.id)
    @ingredients = @ingredients.select { |item| item[:search_name] =~ term }
    puts "*******"
    puts @ingredients
    if request.xhr?
      return @ingredients
    else
      redirect_to user_path(current_user.id)
    end
  end

end
