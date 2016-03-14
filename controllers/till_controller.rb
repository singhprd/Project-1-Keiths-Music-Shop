get '/till' do
  @stocks = Stock.all
  @artists = Artist.all
  @albums = Album.all
  erb :'till/show'
end

post '/till' do
  @params = params
  pry.byebug
end