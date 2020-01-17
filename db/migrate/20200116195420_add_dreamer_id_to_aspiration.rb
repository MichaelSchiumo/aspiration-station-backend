class AddDreamerIdToAspiration < ActiveRecord::Migration[5.2]
  def change
    add_column :aspirations, :dreamer_id, :integer
  end
end
