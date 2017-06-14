class AddDeliveriesToAdverts < ActiveRecord::Migration[5.0]
  def change
    add_column :adverts, :is_domestic_delivery, :boolean
    add_column :adverts, :is_delivery_abroad, :boolean
  end
end
