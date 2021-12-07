class User < ApplicationRecord
  has_secure_password
  has_many :photo
  has_many :comment
  has_many :like

  validates :email,presence: true, format: {with:/\A[^@\s]+@[^@\s]+\z/,message:"Invalid email address"}
  validates :username,presence: true
end
