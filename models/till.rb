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
    sql = "INSERT INTO Till (stock_id, quantity, buy_price, sell_price) VALUES ( '#{@stock_id}', '#{@quantity}', '#{@buy_price}', '#{sell_price}');"
    SqlRunner.run( sql )
  end

  def self.delete_all 
    sql = "DELETE FROM Till"
    SqlRunner.run(sql)
  end

  def self.total_revenue
    sql = "SELECT SUM(sell_price) FROM Till;"
    result = SqlRunner.run(sql)
    result = result[0]
    result = result['sum']
    return result
  end

end