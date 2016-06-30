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

  def find
  end

  def results
    @search_number = params[:search_term]
    @search_user = User.find_by(phone_number: @search_number)

    current_user
    @has_pantry = current_pantry
    ## IF user is not found, @search_user is nil
    if @search_user
      ## IF pantry_id is not found, @pantry is nil
      if @search_user.pantry_id
        @pantry = Pantry.find_by(id: @search_user.pantry_id)
        @users = @pantry.users
      else
        @pantry = nil
      end
    end
    puts "*********"
    puts "Search-Pantry Route Finished."
    puts "Outputs: "
    puts "@search_user = #{@search_user}"
    puts "@pantry = #{@pantry}"
    puts "@users = #{@users}"
  end

end
