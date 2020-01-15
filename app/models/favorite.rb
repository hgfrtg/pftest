# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  music_id   :integer
#  user_id    :integer
#
# Indexes
#
#  index_favorites_on_music_id  (music_id)
#  index_favorites_on_user_id   (user_id)
#

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :music
end
