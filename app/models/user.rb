class User < ActiveRecord::Base
  belongs_to :pantry
  belongs_to :personalstore, class_name:"Pantry"

  has_secure_password
end
