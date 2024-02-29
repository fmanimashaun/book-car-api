class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.string :image_url, default: ''

      t.timestamps
    end
  end
end
