class AddGroupIdToHangouts < ActiveRecord::Migration
  def change
    add_column :hangouts, :group_id, :integer
  end
end
