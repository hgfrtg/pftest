class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :title, null: false
      t.string :audio, null: false
      t.text :description
      t.string :jacket_image_id

      t.timestamps
    end
  end
end
