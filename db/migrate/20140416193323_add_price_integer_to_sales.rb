class AddPriceIntegerToSales < ActiveRecord::Migration
  def change
     remove_column :sales, :price
  end
end
