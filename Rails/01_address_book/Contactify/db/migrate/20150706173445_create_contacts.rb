class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :name
    	t.string :address
    	t.integer :phone1
    	t.integer :phone2
    	t.string :email1
    	t.string :email2

      t.timestamps null: false
    end
  end
end
