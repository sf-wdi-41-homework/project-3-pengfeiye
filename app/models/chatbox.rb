class Chatbox < ApplicationRecord
  has_many :userchatboxes
  has_many :users, through: :userchatboxes
  has_many :messages
end
