require 'minitest/autorun'
require 'minitest/rg'
require_relative '../album'
require_relative '../artist'
require_relative '../stock'

class TestStock < MiniTest::Test

  def setup
    artist = Artist.new({ 'name' => "Boyzone" })
    album = Album.new({ 'title' => "Wings", 'artist' => artist, 'id' => 1 })    
    params = {
      'album_id' => album.id,
      'quantity' => 20,
    }
    @stock = Stock.new( params )
  end

  def test_stock_has_album
    result = @stock.album_id
    assert_equal( 1, result )
  end

  def test_stock_has_quantity
    result = @stock.quantity
    assert_equal( 20, result)
  end






end
