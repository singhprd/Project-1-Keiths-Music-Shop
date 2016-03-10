require 'minitest/autorun'
require 'minitest/rg'
require_relative '../album'
require_relative '../artist'


class TestAlbum < MiniTest::Test

  def setup 
    artist = Artist.new({ 'name' => "Boyzone" })
    @album = Album.new( 'title' => "Wings", 'artist' => artist, 'id' => 1 )
  end

  def test_album_has_title
    result = @album.title
    assert_equal( result, "Wings" )    
  end

  def test_album_has_id
    result = @album.id
    assert_equal( 1, result )
  end

  def test_album_has_artist
    result = @album.artist.name
    assert_equal( "Boyzone", result )
  end


end