class SearchController < ApplicationController

  def show
    current_user #Must for current_pantry

    @search_term = params[:search_term]
    regex = "(.|)#{@search_term.downcase}(.|)"
    term = Regexp.new(regex)
    @ingredients = Ingredient.where(pantry_id: current_pantry.id)
    @ingredients = @ingredients.select { |item| item[:search_name] =~ term }
    if request.xhr?
      return @ingredients
    else
      @ingredients
    end
  end

end
