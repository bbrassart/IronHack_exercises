class AddBbqidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :barbecue_id, :integer
  end
end
