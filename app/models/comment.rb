# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#  photo_id   :integer          not null
#
# Indexes
#
#  index_comments_on_author_id  (author_id)
#  index_comments_on_photo_id   (photo_id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
end
