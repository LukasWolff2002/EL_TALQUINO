class AddTableUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest  # Cambia 'password' a 'password_digest'
    
      t.timestamps
    end
  end
end
