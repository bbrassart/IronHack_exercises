class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :winner_faction
      t.string :loser_faction
      t.datetime :duration
      t.datetime :date

      t.timestamps null: false
    end
  end
end
