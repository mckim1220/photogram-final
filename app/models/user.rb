# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  has_many :photo, foreign_key: :owner_id
  has_many :comment
  has_many :like

  validates :email,presence: true, format: {with:/\A[^@\s]+@[^@\s]+\z/,message:"Invalid email address"}
  validates :username,presence: true
end
