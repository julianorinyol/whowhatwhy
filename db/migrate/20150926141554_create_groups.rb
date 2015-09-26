class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.timestamps null: false
      t.string :name
    end
    create_table :groups_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.timestamps null: false
    end
  end
end
