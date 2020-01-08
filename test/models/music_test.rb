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

require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
