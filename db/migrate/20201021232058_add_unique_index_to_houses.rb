class AddUniqueIndexToHouses < ActiveRecord::Migration[6.0]
  def change
    add_index :houses, :zillow_id, unique: true
  end
end
