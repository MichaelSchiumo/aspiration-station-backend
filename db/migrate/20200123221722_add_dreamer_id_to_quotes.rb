class AddDreamerIdToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :dreamer_id, :integer
  end
end
