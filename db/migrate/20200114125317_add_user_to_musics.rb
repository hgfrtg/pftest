class AddUserToMusics < ActiveRecord::Migration[5.2]
  def change
    add_reference :musics, :user, foreign_key: true
  end
end
