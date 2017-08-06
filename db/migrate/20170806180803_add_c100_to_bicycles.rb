class AddC100ToBicycles < ActiveRecord::Migration[5.0]
  def change
    add_column :bicycles, :c100, :string
  end
end
