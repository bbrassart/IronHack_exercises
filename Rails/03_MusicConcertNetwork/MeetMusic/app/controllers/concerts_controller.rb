class ConcertsController < ApplicationController

    before_action :admin_only, only: [:new, :create]

    def index
        @concerts = Concert.fetch
        @today_concerts = Concert.where(date: Date.current)
 		dt = DateTime.now.end_of_month
    	@month_concerts = Concert.where(:date => Date.current.beginning_of_day..Date.current.end_of_month).order(:date)
    end

    def show
        @concert = Concert.find params[:id]
    end

    def destroy
    	@concert = Concert.find(params[:id]).try(:destroy)
    	redirect_to concerts_path, notice: "The concert of #{@concert.band} has been destroyed."
  	end

	def edit
		@concert = Concert.find(params[:id])
	end

	def new
    	@concert = Concert.new
    end

	def create
		@concert = Concert.new(concert_params)
		if Concert.find_by(band: params[:concert][:band])
			redirect_to new_concert_path, notice: 'The concert already exists. Please create a new one...'	
		elsif @concert.valid?
			@concert.save
			redirect_to concerts_path, notice: 'The concert was successfully created.'
		else
			render :new
		end
	end

	def update
		@concert = Concert.find_by(id: params[:id])
		if @concert.update_attributes(concert_params)
			redirect_to concerts_path, notice: 'Concert was successfully updated.'
		else
			render :edit
		end
	end

	private

	def concert_params
		params.require(:concert).permit(:band, :venue, :city, :date, :price, :description, :logo, comments_attributes: [:user, :message])
	end

end
