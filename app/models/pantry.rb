class Pantry < ActiveRecord::Base
  has_many :users
  has_many :users, foreign_key: "personalstore_id"

  has_many :ingredients

end
