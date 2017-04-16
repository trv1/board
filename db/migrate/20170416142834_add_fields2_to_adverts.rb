class AddFields2ToAdverts < ActiveRecord::Migration[5.0]
  def change
    add_reference :adverts, :brand, foreign_key: true
  end
end
