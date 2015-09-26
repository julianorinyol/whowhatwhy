class CreateTableHangoutsUsers < ActiveRecord::Migration
  def change
    create_table :table_hangouts_users, :id => false do |t|
      t.integer :hangout_id
      t.integer :user_id
    end
  end
end
