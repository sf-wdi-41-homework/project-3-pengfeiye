class User < ApplicationRecord
  has_many :userchatboxes, dependent: :destroy
  has_many :chatboxes, through: :userchatboxes
  has_many :messages, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: {case_sensitive:false}
  validates :username, :password,  presence:true
  validates :username, length: { in: 4..10 }
  validates :password, length: { in: 6..20 }

end
