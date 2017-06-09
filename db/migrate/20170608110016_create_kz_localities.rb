class CreateKzLocalities < ActiveRecord::Migration[5.0]
  def change
    create_table :kz_localities do |t|
      t.integer :geoname_id
      t.string :name
      t.references :parent, foreign_key: {to_table: :kz_localities}

      t.timestamps
    end
  end
end
