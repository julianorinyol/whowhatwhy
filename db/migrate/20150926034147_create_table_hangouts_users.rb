class CreateTableHangoutsUsers < ActiveRecord::Migration
  def change
    create_table :hangouts_users, :id => false do |t|
      t.integer :hangout_id
      t.integer :user_id
    end
  end
end
