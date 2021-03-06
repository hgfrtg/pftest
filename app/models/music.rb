# == Schema Information
#
# Table name: musics
#
#  id              :integer          not null, primary key
#  audio           :string           not null
#  description     :text
#  title           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  jacket_image_id :string
#  user_id         :integer
#
# Indexes
#
#  index_musics_on_user_id  (user_id)
#

class Music < ApplicationRecord
	mount_uploader :audio, AudioUploader
	attachment :jacket_image

	belongs_to :user
	validates :title, :audio, :presence => true
	has_many :music_comments, dependent: :delete_all
	has_many :favorites, dependent: :destroy
	has_many :clips, dependent: :destroy
	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end
end
