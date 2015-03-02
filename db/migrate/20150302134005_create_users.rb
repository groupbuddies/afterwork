class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 60, null: false
      t.string :email
      t.string :location
      t.string :gender
    end
  end
end
