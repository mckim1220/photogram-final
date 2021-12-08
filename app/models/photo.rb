# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
#
# Indexes
#
#  index_photos_on_user_id  (user_id)
#
class Photo < ApplicationRecord
  mount_uploader :image, PostUploader
  belongs_to :user
  has_many :comment
  has_many :like
end
