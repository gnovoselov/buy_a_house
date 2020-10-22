class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :photo
      t.string :address
      t.string :zillow_id

      t.timestamps
    end
  end
end
