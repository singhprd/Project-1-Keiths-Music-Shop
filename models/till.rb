require_relative 'sqlrunner'
class Till

  attr_reader :id, :stock_id, :quantity, :sell_price, :buy_price

  def initialize( params )
    @id = params['id']
    @stock_id = params['stock_id']
    @quantity = params['quantity']
    @buy_price = params['buy_price']
    @sell_price = params['sell_price']
  end

  def save( params )
    stock = Stock.find(@stock_id.to_i)
    sql = "INSERT INTO Till (stock_id, quantity, buy_price, sell_price) VALUES ( '#{@stock_id}', '#{@quantity}', '#{@buy_price}', '#{sell_price}');"
    SqlRunner.run( sql )
  end

  def self.delete_all 
    sql = "DELETE FROM Till"
    SqlRunner.run(sql)
  end

  def self.total_revenue
    sql = "SELECT SUM(sell_price * quantity) FROM Till;"
    result = SqlRunner.run(sql)
    result = result[0]
    result = result['sum']
    return result
  end

  def self.select_all
    sql = "SELECT * FROM Till"
    till = SqlRunner.run( sql )
    result = till.map { |till| Till.new( till ) }
    return result
  end

end