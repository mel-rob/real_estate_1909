require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test

  def setup
    @room = Room.new(:bedroom, 10, 13)
  end

  def test_it_exists
    assert_instance_of Room, @room
  end

  def test_category_exists
    assert_equal :bedroom, @room.category
  end

  def test_area_exists
    assert_equal 130, @room.area
  end


end
