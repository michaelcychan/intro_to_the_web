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

get '/cat' do
  erb(:index)
end