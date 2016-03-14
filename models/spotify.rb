require 'rspotify'
require_relative 'album'
require_relative 'artist'

# artists = RSpotify::Artist.search('Arctic Monkeys')

# arctic_monkeys = artists.first

# puts arctic_monkeys.popularity 

# play arctic_monkeys.top_tracks(:US).first #=> (Track array)

class Spotify

  def self.find_album( album_id )
    album_to_find = Album.find( album_id ).title
    album = RSpotify::Album.search("#{album_to_find}")
    album = album.first
    album = album.uri
    return album
  end

end
