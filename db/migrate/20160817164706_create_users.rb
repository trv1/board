class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :phone, unique: true
      t.string :email, unique: true
      t.string :password_digest
      t.string :locale, limit: 2, null: true

      t.timestamps
    end
  end
end
