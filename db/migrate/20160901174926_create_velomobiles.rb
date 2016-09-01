class CreateVelomobiles < ActiveRecord::Migration[5.0]
  def change
    create_table :velomobiles do |t|
      t.integer :price
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
