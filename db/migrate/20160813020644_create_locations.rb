class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|

      t.timestamps
      t.string :ch_name
      t.string :en_name
      t.string :open_time
      t.text :description
      t.integer :location_type
      t.string :lat
      t.string :lng
    end
  end
end
