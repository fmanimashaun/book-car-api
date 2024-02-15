class CreateCarDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :car_details do |t|
      t.references :car, null: false, foreign_key: true
      t.references :engine_type, null: false, foreign_key: true
      t.integer :horsepower
      t.integer :torque
      t.string :fuel_economy
      t.integer :seating_capacity
      t.string :cargo_space
      t.string :infotainment_system
      t.string :safety_rating
      t.string :tech_features
      t.string :special_features

      t.timestamps
    end
  end
end
