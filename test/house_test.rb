require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_price_exists
    assert_equal "$400000", @house.price
  end

  def test_address_exists
    assert_equal "123 sugar lane", @house.address
  end

  def test_rooms_exist
    assert_equal [], @house.rooms
  end

  def test_add_room
    @house.add_room(@room_1)
    assert_instance_of Room, @house.rooms.first
  end

  def test_add_another_room
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal 2, @house.rooms.count
  end

  def test_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal 2, @house.rooms_from_category(:bedroom).count

    @house.add_room(@room_3)
    assert_equal 1, @house.rooms_from_category(:living_room).count
    assert_equal 2, @house.rooms_from_category(:bedroom).count

    @house.add_room(@room_4)
    assert_equal 1, @house.rooms_from_category(:basement).count
    assert_equal 1, @house.rooms_from_category(:living_room).count
    assert_equal 2, @house.rooms_from_category(:bedroom).count
  end

end
