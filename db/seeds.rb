require_relative( '../models/artist' )
require_relative( '../models/album' )
require_relative( '../models/stock' )
require_relative( '../models/till' )



Till.delete_all
Stock.delete_all
Album.delete_all
Artist.delete_all


bruce = Artist.new({ 'name' => 'Bruce Springsteen' })
bruce = bruce.save

album1 = Album.new({ 'title' => "Wrecking Ball", 'artist_id' => bruce.id })
album2 = Album.new({ 'title' => 'The Rising', 'artist_id' => bruce.id })
album1.save
album2.save


opm = Artist.new({ 'name' => 'OPM' })
opm = opm.save
menacetosobriety = Album.new({ 'title' => 'Menace To Sobriety', 'artist_id' => opm.id })
menacetosobriety.save

artist = Artist.new({ 'name' => 'Clean Bandit' })
artist = artist.save

album1 = Album.new({ 'title' => "New Eyes", 'artist_id' => artist.id })
album2 = Album.new({ 'title' => 'Real Love', 'artist_id' => artist.id })
album1.save
album2.save


artist = Artist.new({ 'name' => 'Public Service Broadcasting' })
artist = artist.save
album = Album.new({ 'title' => 'The Race for Space', 'artist_id' => artist.id })
album.save

artist = Artist.new({ 'name' => 'Hilltop Hoods' })
artist = artist.save
album = Album.new({ 'title' => 'Drinking from the Sun', 'artist_id' => artist.id })
album.save

nil
