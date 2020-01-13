# == Schema Information
#
# Table name: musics
#
#  id          :integer          not null, primary key
#  audio       :string           not null
#  description :text
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_musics_on_user_id  (user_id)
#

class Music < ApplicationRecord
	mount_uploader :audio, AudioUploader

	belongs_to :user
	validates :title, :audio, :presence => true
	has_many :music_comments
end
