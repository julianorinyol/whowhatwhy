class CreateTableActivitiesHangouts < ActiveRecord::Migration
  def change
    create_table :activities_hangouts, :id => false do |t|
      t.integer :hangout_id
      t.integer :activity_id
    end
  end
end
