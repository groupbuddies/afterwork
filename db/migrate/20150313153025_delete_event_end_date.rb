class DeleteEventEndDate < ActiveRecord::Migration
  def change
    remove_column :events, :end_date, :datetime
  end
end
