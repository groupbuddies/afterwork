class AddOwnerFieldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :owner, :integer, null: false
  end
end
