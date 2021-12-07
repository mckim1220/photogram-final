class Photo < ApplicationRecord
  mount_uploader :image, PostUploader
  belongs_to :user
  has_many :comment
  has_many :like
end
