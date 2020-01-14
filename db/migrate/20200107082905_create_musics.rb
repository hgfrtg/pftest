class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :title, null: false
      t.string :audio, null: false
      t.text :description

      t.timestamps
    end
  end
end
