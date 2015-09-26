class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.boolean :from_google
      t.timestamps null: false
    end
  end
end
