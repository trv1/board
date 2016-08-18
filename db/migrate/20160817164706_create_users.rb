class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :phone
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
