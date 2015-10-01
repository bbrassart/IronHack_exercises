require_relative "./models.rb"
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

set :port, 3001
set :bind, '0.0.0.0'
enable :sessions

get '/' do
  @users = User.all
  @shouts = Shout.all
	erb :home
end

get '/oops' do
	erb :oops
end

get '/signup' do
	@users = User.all
	@shouts = Shout.all
	erb :signup
end

get '/shouts/:id' do
  shout = Shout.find(params[:id])
  shout.destroy
  redirect to('/')
end

post '/shout' do
	User.all.each do |user_reg|
		if user_reg.handle == params[:handle] && user_reg.password == params[:password]
			user_reg.shouts.create(message: params[:message], likes: 0)
			redirect to('/')
		end
	end
end


post '/signup' do
	if user = User.create(name: params[:name], handle: params[:handle], password: params[:password]).valid?
  	redirect to('/')
  else
  	redirect to ('/oops')
  end
end
