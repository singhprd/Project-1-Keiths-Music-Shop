require_relative 'album'
require_relative 'artist'

class Stock

  attr_reader :album_id, :quantity, :id, :buy_price, :sell_price

  def initialize( params )
    @id = params['id']
    @album_id = params['album_id']
    @quantity = params['quantity']
    @buy_price = params['buy_price']
    @sell_price = params['sell_price']
  end

  def save
    sql = "INSERT INTO Stocks (album_id, quantity, buy_price, sell_price) VALUES ('#{@album_id}', '#{@quantity}', #{@buy_price}, #{@sell_price});"
    SqlRunner.run( sql )
    return last_entry()
  end

  def last_entry
    sql = "SELECT * FROM Stocks ORDER BY id DESC limit 1;"
    return Stock.map_item(sql)
  end

  def self.reduce_quantity_check(amount, stock_id)
    sql1 = "SELECT quantity FROM Stocks WHERE id = #{stock_id}"
    previous = SqlRunner.run( sql1 )
    previous = previous[0]['quantity'].to_i
    if previous >= amount 
      return true
    elsif previous < amount
      return false
    end    
  end

  def self.reduce_quantity( amount, stock_id )
    sql1 = "SELECT quantity FROM Stocks WHERE id = #{stock_id}"
    previous = SqlRunner.run( sql1 )
    previous = previous[0]['quantity'].to_i
    sql2 = "UPDATE Stocks SET quantity = #{previous - amount} WHERE id = #{stock_id}"
    SqlRunner.run(sql2)
  end

  def self.find( id )
   sql = "SELECT * FROM Stocks WHERE id = #{id}"
   result = Stock.map_item( sql )
   return result
 end

 def self.search_artist( input )
  sql = "SELECT id FROM Artists WHERE name LIKE '%#{input}%'"
  artist_id = SqlRunner.run(sql)
  if artist_id.count == 0
    return false
  end
  artist_id = artist_id[0]['id']
  sql = "SELECT id FROM Albums WHERE artist_id = #{artist_id}"
  album_ids = SqlRunner.run(sql)
  id_array = Array.new
  album_ids.each do |value|
   id_array << value['id'].to_i
 end
 stock_objects_array = Array.new

 for each in id_array 
  stock = Stock.find(each)
  stock_objects_array << stock
end
return stock_objects_array
end

def self.search_album( input )
  sql = "SELECT id FROM ALBUMS WHERE title LIKE '%#{input}%'"
  album_ids = SqlRunner.run(sql)
  if album_ids.count == 0
    return false
  end
  id_array = Array.new
  album_ids.each do |value|
   id_array << value['id'].to_i
 end
 stock_objects_array = Array.new
 for each in id_array 
  stock = Stock.find(each)
  stock_objects_array << stock
end
return stock_objects_array 
end

def self.all()
  sql = "SELECT * FROM Stocks ORDER BY id"
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

def self.update_all( params )
  for key, value in params
    value = value.to_i
    if value > 0
      sql = "SELECT quantity FROM Stocks WHERE id = #{key}"
      pgresult = SqlRunner.run(sql)
      previous = pgresult[0]['quantity'].to_i
      sql = "UPDATE Stocks SET quantity=#{value + previous} WHERE id = #{key}"
      SqlRunner.run( sql )
    end
  end
end

end
