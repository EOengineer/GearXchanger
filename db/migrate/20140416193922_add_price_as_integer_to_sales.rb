class AddPriceAsIntegerToSales < ActiveRecord::Migration
  def change
    add_column :sales, :price, :decimal, null: false
  end
end
