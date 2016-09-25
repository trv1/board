class AddParentToLocation < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :parent
    change_table :locations do |t|
      t.references :parent, :references, index: true
    end
  end
end
