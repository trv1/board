class AddFields1ToAdverts < ActiveRecord::Migration[5.0]
  def change
    add_column :adverts, :model, :string
    add_column :adverts, :year, :integer
    add_column :adverts, :state, :string
    add_column :adverts, :color, :string
    add_column :adverts, :mileage, :integer
    add_column :adverts, :country_id, :integer
    add_column :adverts, :place, :string
    add_column :adverts, :name, :string
    add_column :adverts, :phone, :string
    add_column :adverts, :email, :string
    add_column :adverts, :is_exchange, :boolean
    add_column :adverts, :time, :string
    add_column :adverts, :count, :integer
    add_column :adverts, :description, :string
    add_column :adverts, :price, :integer
  end
end
