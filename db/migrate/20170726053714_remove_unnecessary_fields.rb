class RemoveUnnecessaryFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :bicycles, :price
    remove_column :bicycles, :brand_id

    remove_column :velomobiles, :price
    remove_column :velomobiles, :brand_id
  end
end
