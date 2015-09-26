class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.boolean :primary
      t.string :google_id
      t.timestamps null: false
      t.string :summary
    end
  end
end
