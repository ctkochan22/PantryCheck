class Ingredient < ActiveRecord::Base
  belongs_to :pantry


  @@categories = {
    0 => 'Please Select--',
    1 => 'Beverage',
    2 => 'Bread/Bakery',
    3 => 'Canned/Jarred Goods',
    4 => 'Dairy',
    5 => 'Dry/Baking Goods',
    6 => 'Frozen Goods',
    7 => 'Meat',
    8 => 'Spice',
    9 => 'Produce',
    10 => 'Misc'
  }

  @@storage_types = {
    0 => 'Please Select--',
    1 => 'Basic (Full, half, almost empty, etc.)',
    2 => 'Number (0.5, 1, 2, etc.)'
  }




  def self.categories_array
    categories_array = []
    @@categories.each do |key, value|
      categories_array << [value, key]
    end
    return categories_array
  end

  def self.storage_types_array
    storage_array = []
    @@storage_types.each do |key, value|
      storage_array << [value, key]
    end
    return storage_array
  end
end
