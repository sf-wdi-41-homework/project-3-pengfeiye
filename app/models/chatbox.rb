class Chatbox < ApplicationRecord
  has_many :userchatboxes, dependent: :destroy
  has_many :users, through: :userchatboxes
  has_many :messages, dependent: :destroy
end
