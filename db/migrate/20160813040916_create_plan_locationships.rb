class CreatePlanLocationships < ActiveRecord::Migration
  def change
    create_table :plan_locationships do |t|

      t.timestamp
      t.integer :plan_id
      t.integer :location_id
    end
  end
end
