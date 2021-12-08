# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer          not null
#  photo_id   :integer          not null
#
# Indexes
#
#  index_likes_on_fan_id    (fan_id)
#  index_likes_on_photo_id  (photo_id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :photo
end
