class Stock

  attr_reader :album_id, :quantity, :id

  def initialize( params )
    @album_id = params['album_id']
    @quantity = params['quantity']
    @id = params['id']
  end

  def save
    sql = "INSERT INTO Stocks (album_id, quantity) VALUES ('#{@album_id}', '#{@quantity}');"
    SqlRunner.run( sql )
    return last_entry()
  end

  def last_entry
    sql = "SELECT * FROM Stocks ORDER BY id DESC limit 1;"
    return Stock.map_item(sql)
  end


  def self.find( id )
   sql = "SELECT * FROM Stocks WHERE id = #{id}"
   result = SqlRunner.run( sql )
   return result
   end

   def self.all()
    sql = "SELECT * FROM Stocks"
    return Stock.map_items(sql)
  end

  def self.delete_all 
    sql = "DELETE FROM Stocks"
    SqlRunner.run(sql)
  end


  def self.map_item(sql)
    result = Stock.map_items(sql)
    return result.first
  end  

  def self.map_items(sql)
    stock = SqlRunner.run(sql)
    result = stock.map { |stock| Stock.new( stock ) }
    return result
  end

end