require 'sinatra'
require "sinatra/reloader"

get '/' do
  "Hello"
end

get '/secret' do
  "Secret route"
end

get 'other_route' do
  "This is another route"
end