class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :product
      t.references :barbecue, index: true

      t.timestamps null: false
    end
  end
end
