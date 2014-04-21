class AddImageToSale < ActiveRecord::Migration
  def change
    add_column :sales, :image, :string
  end
end
