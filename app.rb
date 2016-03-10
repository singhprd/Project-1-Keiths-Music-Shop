require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'models/artist'
require_relative 'models/album'
require_relative 'models/stock'

get '/' do
  return "hello world"
end