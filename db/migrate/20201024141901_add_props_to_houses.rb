class AddPropsToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :favorite, :boolean, default: false
    add_column :houses, :hidden, :boolean, default: false
    add_column :houses, :comment, :text
  end
end
