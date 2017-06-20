class AddIsAroundTheClockToAdverts < ActiveRecord::Migration[5.0]
  def change
    add_column :adverts, :is_around_the_clock, :boolean
  end
end
