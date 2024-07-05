require 'minitest/autorun'
require './playlist'
require "stringio"

class TestPlaylist < Minitest::Test
  def test_run
    # Simulate user input
    input = StringIO.new("4\n")
    output = StringIO.new
    $stdin = input
    $stdout = output

    playlist = Playlist.new
    playlist.run

    expected_output = <<~OUTPUT
      \nWelcome to your playlist!
      1. Add a song
      2. List songs
      3. Shuffle playlist
      4. Quit
      Choose an option: 
      
      Thank you for creating your playlist. Goodbye!
      OUTPUT

    assert_equal expected_output, output.string

    # Reset $stdin
    $stdin = STDIN
    $stdout = STDOUT
  end
end
