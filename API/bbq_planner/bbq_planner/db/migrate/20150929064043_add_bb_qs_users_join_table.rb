class AddBbQsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :barbecues_users, :id => false do |t|
      t.integer :barbecue_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :barbecues_users
  end
end
