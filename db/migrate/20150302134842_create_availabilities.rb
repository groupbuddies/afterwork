class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :week_day, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :user_id, null: false
    end
  end
end
