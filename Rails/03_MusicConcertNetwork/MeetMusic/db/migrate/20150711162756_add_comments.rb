class AddComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.integer  	:concert_id
  		t.string		:visitor
  		t.text			:message

  		t.timestamps null: false
  	end
	end
end
