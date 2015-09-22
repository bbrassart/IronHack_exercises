class RemoveDuration < ActiveRecord::Migration
  def change
    remove_column :matches, :duration
  end
end
