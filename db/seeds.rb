require_relative( '../models/artist' )
require_relative( '../models/album' )
require_relative( '../models/stock' )
require( 'pry-byebug' )

Stock.delete_all
Album.delete_all
Artist.delete_all


boyzone = Artist.new({ 'name' => 'Boyzone' })
boyzone = boyzone.save

wings = Album.new({ 'title' => "Wings", 'artist_id' => boyzone.id })
byrequest = Album.new({ 'title' => 'By Request', 'artist_id' => boyzone.id })
wings.save
byrequest.save

steps = Artist.new({ 'name' => 'Steps' })
steps = steps.save

steptacular = Album.new({ 'title' => 'Steptacular', 'artist_id' => steps.id })
stepone = Album.new({ 'title' => 'Step One', 'artist_id' => steps.id })
steptacular.save
stepone.save

opm = Artist.new({ 'name' => 'OPM' })
opm = opm.save
menacetosobriety = Album.new({ 'title' => 'Menace To Sobriety', 'artist_id' => opm.id })
heavencanwait = Album.new({ 'title' => 'Heaven Can Wait', 'artist_id' => opm.id })
menacetosobriety.save
heavencanwait.save


nil
