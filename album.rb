class Album 

attr_reader :title, :artist, :id

  def initialize( params )
    @title = params['title']
    @artist = params['artist']
    @id = params['id'] 
  end

end