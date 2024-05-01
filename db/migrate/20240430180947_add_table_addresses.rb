class AddTableAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :description

      t.timestamps
    end
  end
end
