class AddNewDurationToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :duration, :integer
  end
end
