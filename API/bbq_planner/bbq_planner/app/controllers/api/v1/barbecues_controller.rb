class Api::V1::BarbecuesController < ApplicationController

  def show_all
   barbecues = Barbecue.all
   attended_barbecues = [];
   unattended_barbecues = [];
   barbecues.each do |bbq|
     if bbq.users.include?(current_user)
       attended_barbecues << bbq
     else
       unattended_barbecues << bbq
     end
   end
   render json: {:attended_barbecues => attended_barbecues, :unattended_barbecues => unattended_barbecues};
  end

  def join_bbq
    id = params[:id]
    barbecue = Barbecue.find(id)
    unless barbecue.users.include?(current_user)
      barbecue.users << current_user
      barbecue.save
    end
    render :json => 'ok'
  end

  def additem
    user_product = params[:value]
    barbecue = Barbecue.find(params[:bbq])
    barbecue.items.new(product: user_product)
    if barbecue.users.include?(current_user)
      barbecue.save
    end
  end

  def show_bbq
    id = params[:id]
    barbecue = Barbecue.find(id)
    users = barbecue.users
    items = barbecue.items
    participating = false
    if users.include?(current_user)
      participating = true
    end
    render json: {:participating => participating, :barbecue => barbecue, :users => users, items: items}
  end
end
