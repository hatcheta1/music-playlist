require_relative "song"

class Playlist
  def initialize
    @songs = []
  end

  def run
    while input != "4" do
      puts "Welcome to your playlist!"
      puts "1. Add a song"
      puts "2. Rate a song"
      puts "3. List songs"
      puts "4. Quit"
      puts "Choose an option: "

      input = gets.chomp

      if input == "1"
        add_song
      end

      if input == "2"
        rate_song
      end

      if input == "3"
        list_songs
      end

      if input == "4"
        puts "Thank you for creating your playlist. Goodbye!"
      end
    end
  end

  def add_song
    print "Enter name of the song: "
    name = gets.chomp
    print "Enter the song's artist: "
    artist = gets.chomp
    print "Enter the song's genre: "
    genre = gets.chomp

    @playlist.push(Song.new(name, artist, genre))
    puts "The song was successfully added to the playlist!"
  end

  def rate_song
    print "What song would you like to rate? "
    song = gets.chomp

    print "What is your rating of this song? "
    rating = gets.chomp

    if @playlist.include?(song)
      @playlist[@playlist.index(song)].rating = rating
    end

    puts "You rated #{song} a #{rating} out of 5."
  end

  def list_songs
    puts "Would you like to: "
    puts "1. List all songs."
    puts "2. List songs by genre."
    option = gets.chomp

    if option == "1"
    puts "Here is your playlist: "
    @playlist.each do |song|
      puts song
    end

    elsif option == "2"
      puts "What music genre would you like to see? "
      genre = gets.chomp
      songs_of_chosen_genre = []

      @playlist.each do |song|
        if song.genre == genre
          @songs_of_chosen_genre.push(song)
        end
      end
    end
  end

end
