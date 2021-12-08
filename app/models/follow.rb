# == Schema Information
#
# Table name: follows
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer          not null
#  sender_id    :integer          not null
#
class Follow < ApplicationRecord
end
