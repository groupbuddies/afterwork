class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, limit: 60, null: false
      t.text :description
      t.string :location, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :hashtag, limit: 60
    end
  end
end
