class AddOwnerFieldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :owner_id, :integer, null: false
  end
end
