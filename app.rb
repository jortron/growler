require 'sinatra'
require 'sinatra/reloader'

enable :sessions

before do
	session[:growl_directory] ||= []
end

#routes
get '/' do
	@growl_directory = session[:growl_directory]
	erb :index
end

get '/store_growl' do 
	@growl_directory = session[:growl_directory]
	erb :store_growl
end

# add a new growl to the page
post '/add_growl' do 
	session[:growl_directory] << params[:growl_name]
	redirect '/'
end 

