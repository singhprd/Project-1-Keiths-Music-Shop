get '/till' do
  @stocks = Stock.all
  @artists = Artist.all
  @albums = Album.all
  @total_revenue = Till.total_revenue
  erb :'till/show'
end

post '/till' do
  id = params['stock_id'].to_i
  stock = Stock.find( id )
  buy_price = stock.buy_price.to_i
  sell_price = stock.sell_price.to_i
  params['buy_price'] = buy_price
  params['sell_price'] = sell_price
  quantity = params['quantity'].to_i
    if Stock.reduce_quantity_check( quantity, id)
      Stock.reduce_quantity( quantity, id )
    else 
      redirect :'/till/out_of_stock'
    end
  till = Till.new( params )
  till.save( params )
  @till = till
  redirect '/till'
end

get '/till/out_of_stock' do
  erb :'/till/out_of_stock'
end

get '/till/index' do
  @tills = Till.select_all
  erb :'/till/index'
end