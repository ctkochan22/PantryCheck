class Invite < ActiveRecord::Base
  belongs_to :pantry
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :user, foreign_key: "user_id"
end
