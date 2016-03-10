class Album 

attr_reader :title, :artist_id, :id

  def initialize( params )
    @title = params['title']
    @artist_id = params['artist_id']
    @id = params['id'] 
  end

  def save
    sql = "INSERT INTO Albums (title, artist_id) VALUES ('#{@title}', '#{@artist_id}');"
    SqlRunner.run( sql )
    return last_entry()
  end

  def last_entry
    sql = "SELECT * FROM Albums ORDER BY id DESC limit 1;"
    return Album.map_item(sql)
  end


  def self.find( id )
   sql = "SELECT * FROM Albums WHERE id = #{id}"
   result = SqlRunner.run( sql )
   return result
  end

  def self.all()
    sql = "SELECT * FROM Albums"
    return Album.map_items(sql)
  end

  def self.delete_all 
    sql = "DELETE FROM Albums"
    SqlRunner.run(sql)
  end


  def self.map_item(sql)
    result = Album.map_items(sql)
    return result.first
  end  

  def self.map_items(sql)
    album = SqlRunner.run(sql)
    result = album.map { |album| Album.new( album ) }
    return result
  end
  
end