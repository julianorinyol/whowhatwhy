class AddTitleToHangouts < ActiveRecord::Migration
  def change
    add_column :hangouts, :title, :string
  end
end
