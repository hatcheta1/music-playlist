require 'minitest/autorun'
require './song'

class TestSong < Minitest::Test
  def test_to_s
    song = Song.new("Saturn", "SZA", "Alternative R&B")
    assert_equal "Saturn by SZA", song.to_s, "String method failed"
  end
end
