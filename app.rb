require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative 'models/artist'
require_relative 'models/album'
require_relative 'models/stock'
require_relative 'models/till'
require_relative 'controllers/artist_controller'
require_relative 'controllers/album_controller'
require_relative 'controllers/stock_controller'
require_relative 'controllers/till_controller'

get '/' do
  erb :'/homepage'
end