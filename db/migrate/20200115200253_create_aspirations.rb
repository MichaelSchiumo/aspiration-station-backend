class CreateAspirations < ActiveRecord::Migration[5.2]
  def change
    create_table :aspirations do |t|
      t.string :title
      t.string :category
      t.integer :timeframe
      t.string :status

      t.timestamps
    end
  end
end
