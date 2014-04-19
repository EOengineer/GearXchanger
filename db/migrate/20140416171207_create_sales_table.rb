class CreateSalesTable < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :price, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :phone_number
    end
  end
end
