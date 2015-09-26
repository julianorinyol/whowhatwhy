class CreateHangouts < ActiveRecord::Migration
  def change
    create_table :hangouts do |t|

      t.timestamps null: false
    end
  end
end
