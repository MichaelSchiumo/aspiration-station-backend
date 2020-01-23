class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.integer :dreamer_id
      t.timestamps
    end
  end
end
