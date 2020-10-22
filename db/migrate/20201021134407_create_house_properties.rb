class CreateHouseProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :house_properties do |t|
      t.integer :house_id
      t.integer :property_id
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
