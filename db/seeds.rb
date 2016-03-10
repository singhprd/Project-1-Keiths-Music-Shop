require_relative( '../models/artist' )
require_relative( '../models/album' )
require_relative( '../models/stock' )
require( 'pry-byebug' )

Stock.delete_all
Album.delete_all
Artist.delete_all


boyzone = Artist.new({ 'name' => 'Boyzone' })
artist1 = boyzone.save

wings = Album.new({ 'title' => "Wings", 'artist_id' => artist1.id })
album1 = wings.save

stock = Stock.new({ 'quantity' => 20, 'album_id' => album1.id })
stock1 = stock.save


nil
