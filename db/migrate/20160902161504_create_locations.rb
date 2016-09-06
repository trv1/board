class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :geoname_id
      t.string :name
      t.string :ascii_name
      t.decimal :latitude
      t.decimal :longitude
      t.string :country
      t.integer :population
      t.string :timezone
      t.boolean :is_edited
      t.string :code
      t.integer :parent, index: true

      t.timestamps
    end
  end
end
