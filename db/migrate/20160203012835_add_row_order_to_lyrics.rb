class AddRowOrderToLyrics < ActiveRecord::Migration
  def change
    add_column :lyrics, :row_order, :integer
  end
end
