require( 'pg' )
require_relative 'sqlrunner'

class Artist 

  attr_reader :name, :id

  def initialize( params )
    @id = params['id']
    @name = params['name']
  end

  def save
    sql = "INSERT INTO Artists (name) VALUES ('#{@name}');"
    SqlRunner.run( sql )
    return last_entry()
  end

  def update()
    sql = "UPDATE artists SET name='#{@name}' WHERE id = #{@id}"
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
    @id = id
    @result = result[0]
    @batman = Artist.new( result[0] )
    return @batman
  end

  def self.all()
    sql = "SELECT * FROM Artists"
    return Artist.map_items(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM Artists WHERE id = '#{id}'"
    SqlRunner.run(sql)
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