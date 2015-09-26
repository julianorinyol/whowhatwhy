class CreateHangouts < ActiveRecord::Migration
  def change
    create_table :hangouts do |t|
      t.timestamps null: false
      t.string :owner_id
      t.boolean :all_answered
    end
  end
end
