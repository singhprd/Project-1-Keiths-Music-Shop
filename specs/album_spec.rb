require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/album'
require_relative '../models/artist'


class TestAlbum < MiniTest::Test

  def setup 
    artist = Artist.new({ 'name' => "Boyzone" })
    @album = Album.new( 'title' => "Wings", 'id' => 1 )
  end

  def test_album_has_title
    result = @album.title
    assert_equal( result, "Wings" )    
  end

  def test_album_has_id
    result = @album.id
    assert_equal( 1, result )
  end


end