class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.integer :geoname_id
      t.string :name
      t.string :code
      t.string :isolanguage

      t.timestamps
    end
  end
end
