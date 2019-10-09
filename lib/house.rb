class House

attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    room_category = @rooms.find_all do |room|
      room.category == category
    end
    room_category
  end


end
