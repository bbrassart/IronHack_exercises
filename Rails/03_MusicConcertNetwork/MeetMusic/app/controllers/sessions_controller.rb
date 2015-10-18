class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to concerts_path
    else
      redirect_to '/login'
    end
  end

  def new
    render :new
  end

  def destroy
    session.clear
    redirect_to concerts_path
  end
end
