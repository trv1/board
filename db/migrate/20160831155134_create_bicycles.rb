class CreateBicycles < ActiveRecord::Migration[5.0]
  def change
    create_table :bicycles do |t|
      t.integer :price
      t.references :brand, foreign_key: true
      t.string :c1

      t.timestamps
    end
  end
end
