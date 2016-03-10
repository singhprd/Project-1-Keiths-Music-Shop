require( 'pg' )
require_relative 'sqlrunner'

class Artist 

  attr_reader :name, :id

  def initialize( params )
    @name = params['name']
    @id = params['id']
  end

  def save
    sql = "INSERT INTO Artists (name) VALUES ('#{@name}');"
    SqlRunner.run( sql )
    return last_entry()
  end

  def last_entry
    sql = "SELECT * FROM Artists ORDER BY id DESC limit 1;"
    return Artist.map_item(sql)
  end


  def self.find( id )
   sql = "SELECT * FROM Artists WHERE id = #{id}"
   result = SqlRunner.run( sql )
   return result
  end

  def self.all()
    sql = "SELECT * FROM Artists"
    return Artist.map_items(sql)
  end

  def self.delete_all 
    sql = "DELETE FROM Artists"
    SqlRunner.run(sql)
  end


  def self.map_item(sql)
    result = Artist.map_items(sql)
    return result.first
  end  

  def self.map_items(sql)
    artist = SqlRunner.run(sql)
    result = artist.map { |artist| Artist.new( artist ) }
    return result
  end
  
end