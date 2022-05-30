require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "Hello"
end

# remember to add / in front of all routes
get '/secret' do
  "Secret route"
end

get '/other_route' do
  "This is another route"
end

get '/new_route' do
  'new route here!'
end

get '/random-cat' do
  @name = ["Amigo", "Misty", "Almond"].sample
  erb(:index)
end

post '/named-cat' do
  p params
  @name = params[:name]
  @last = params[:last_name]
  erb(:index)
end

# in app.rb
# first, let's write a form-displaying route
get '/cat-form' do
  erb :cat_form
end