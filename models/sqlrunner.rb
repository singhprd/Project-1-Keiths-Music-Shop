require( 'pg' )

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect({ dbname: 'musicshop', user: 'postgres', password: 'postgres', host: 'localhost', port: 5432 })
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end

end