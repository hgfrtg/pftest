class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :audio
      t.text :introduction

      t.timestamps
    end
  end
end
