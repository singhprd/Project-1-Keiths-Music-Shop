class Stock

attr_reader :album_id, :quantity, :id

  def initialize( params )
    @album_id = params['album_id']
    @quantity = params['quantity']
    @id = params['id']
  end


end