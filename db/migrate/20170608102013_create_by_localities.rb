class CreateByLocalities < ActiveRecord::Migration[5.0]
  def change
    create_table :by_localities do |t|
      t.integer :geoname_id
      t.string :name
      t.references :parent, foreign_key: {to_table: :by_localities}

      t.timestamps
    end
  end
end
