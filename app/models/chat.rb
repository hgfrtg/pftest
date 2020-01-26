# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_chats_on_room_id  (room_id)
#  index_chats_on_user_id  (user_id)
#

class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :message, :presence => true
end
