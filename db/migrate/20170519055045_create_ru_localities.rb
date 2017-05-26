class CreateRuLocalities < ActiveRecord::Migration[5.0]
  def change
    create_table :ru_localities do |t|
      t.integer :geoname_id
      t.string :name
      # t.integer :parent_id
      t.references :parent, foreign_key: {to_table: :ru_localities}

      t.timestamps
    end
  end
end
