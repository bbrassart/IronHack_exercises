class CommentsController < ApplicationController

	def new
		@concert = Concert.find(params[:concert_id])
		@comment = Comment.new(:concert=>@concert)
	end

	def create
		@concert = Concert.find(params[:concert_id])
		@comment = @concert.comments.new comment_params
		@comment.visitor = current_user.name
		if @comment.save
			redirect_to concert_path(@concert), notice: 'Your comment has been submitted'
		else
			render :new
		end
	end

	def destroy
		@concert = Concert.find(params[:concert_id])
		@comment = Comment.find_by(id: params[:id]).try(:destroy)
		redirect_to concert_path(@concert), notice: "The comment has been destroyed."
	end

	def mostpopular
		concerts = Concert.all
		temp = concerts.sort { |a,b| b.comments.length <=> a.comments.length} 
		@most_popular_concerts = temp[0..3]
	end

	private
	def comment_params
		params.require(:comment).permit(:message)
	end
end
