class Music < ApplicationRecord
	mount_uploader :audio, AudioUploader

	validates :title, :audio, :presence => true
end
