class AddForeignKeyToSales < ActiveRecord::Migration
  def change
    add_column :sales, :category_id, :integer, null: false
    add_index :sales, :category_id
  end
end
