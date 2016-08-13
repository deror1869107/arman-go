class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|

      t.timestamps

      t.string :start_lat
      t.string :start_lng
      t.string :end_lat
      t.string :end_lng
      t.string :name
      t.date :travel_time
      t.integer :user_id
    end
  end
end
