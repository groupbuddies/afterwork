class ChangeWeekdayColumnType < ActiveRecord::Migration
  def change
    remove_column :availabilities, :week_day, :string
    add_column :availabilities, :week_day, :integer
  end
end
