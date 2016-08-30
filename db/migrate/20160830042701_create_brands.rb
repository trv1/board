class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.boolean :is_popular
      t.boolean :is_velomobile

      t.timestamps
    end
  end
end
