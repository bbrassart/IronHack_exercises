class ContactsController < ApplicationController
	def index
  	@contacts = Contact.order(name: :asc).limit(15)
  end

  def show
		@contact = Contact.find(params[:id])
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def new
  	@contact = Contact.new
  end

  def favourite
  	current_contact = Contact.find(params[:id])
  	current_contact.favourite = true
  	current_contact.save
  	redirect_to contacts_path, notice: 'Marked as favourite!'
  end

  def del_favourite
  	current_contact = Contact.find(params[:id])
  	current_contact.favourite = nil
  	current_contact.save
  	redirect_to contacts_path, notice: 'Deleted the favourite!'
  end

  def show_favourites
		@contacts = Contact.where(favourite: true)
		render :show_favourites
	end

	def create
		@contact = Contact.new(contact_params)
		if Contact.find_by(name: params[:contact][:name])
			redirect_to new_contact_path, notice: 'Contact already exists. Please create a new one...'
		elsif @contact.valid?
			@contact.save
			redirect_to contacts_path, notice: 'Contact was successfully created.'
		else
			render :new
		end
	end

	def update
		@contact = Contact.find_by(id: params[:id])
		if @contact.update_attributes(contact_params)
			redirect_to contacts_path, notice: 'Contact was successfully updated.'
		else
			render :edit
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :address, :phone1, :phone2, :email1, :email2)
	end
end
