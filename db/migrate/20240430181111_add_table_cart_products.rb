class AddTableCartProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_products do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, default: 0
      t.decimal :subtotal, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
