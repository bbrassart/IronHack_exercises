class AddLogoToConcerts < ActiveRecord::Migration
  def change
  	  add_attachment :concerts, :logo
  end
end
