class AddRankToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :rank, :integer, default: 0
  end
end
