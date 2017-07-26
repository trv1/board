class AddEquipmentsToBicycles < ActiveRecord::Migration[5.0]
  def change
    add_column :bicycles, :c90, :boolean
    add_column :bicycles, :c91, :boolean
    add_column :bicycles, :c92, :boolean
    add_column :bicycles, :c93, :boolean
    add_column :bicycles, :c94, :boolean
    add_column :bicycles, :c95, :boolean
    add_column :bicycles, :c96, :boolean
    add_column :bicycles, :c97, :boolean
    add_column :bicycles, :c98, :string
    add_column :bicycles, :c99, :boolean
  end
end
