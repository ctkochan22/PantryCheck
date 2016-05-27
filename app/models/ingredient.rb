class Ingredient < ActiveRecord::Base
  belongs_to :pantry
  attr_reader :categories


  @@categories = {
    'none' => 'Please Select--',
    'bev' => 'Beverage',
    'bre' => 'Bread/Bakery',
    'can' => 'Canned/Jarred Goods',
    'dai' => 'Dairy',
    'dry' => 'Dry/Baking Goods',
    'frz' => 'Frozen Goods',
    'mea' => 'Meat',
    'spi' => 'Spice',
    'pro' => 'Produce',
    'msc' => 'Misc'
  }

  @@storage_types = {
    'none' => 'Please Select--',
    'bsc' => 'Basic (Full, half, almost empty, etc.)',
    'num' => 'Number (0.5, 1, 2, etc.)'
  }

  @@bsc_storage = ["Please Select--", "Full", "More than Half", "Half", "Quarter Full", "Almost Empty", "Empty"]

  def category_name
    return @@categories[self.category]
  end

  def self.abrev_to_name(abrev)
    return @@categories[abrev]
  end

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

  def self.bsc_storage
    return @@bsc_storage
  end
end
