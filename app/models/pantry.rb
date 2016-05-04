class Pantry < ActiveRecord::Base
  has_many :users
  has_many :private_users, class_name: "User", foreign_key: "personalstore_id"

  has_many :ingredients

end
