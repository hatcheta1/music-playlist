require_relative "song"

class Playlist
  def initialize
    @songs = []
  end

  def run
    input = 0

    while input != "4" do
      puts "\n"
      puts "Welcome to your playlist!"
      puts "1. Add a song"
      puts "2. Rate a song"
      puts "3. List songs"
      puts "4. Quit"
      puts "Choose an option: "

      input = gets.chomp

      if input == "1"
        add_song

      elsif input == "2"
        rate_song

      elsif input == "3"
        list_songs

      elsif input == "4"
        puts "\n"
        puts "Thank you for creating your playlist. Goodbye!"

      else
        puts "\n"
        puts "Invalid input. Please try again."
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

    @songs.push(Song.new(name, artist, genre))
    puts "\n"
    puts "'#{name}' was successfully added to the playlist!"
  end

  def rate_song
    print "What song would you like to rate? "
    song = gets.chomp

    print "What is your rating of this song (out of 5)? "
    rating = gets.chomp.to_i

    if rating < 1 || rating > 5
      puts "Invalid rating. Please try again."

    else
      if @songs.include?(song)
        @songs[@songs.index(song)].rating = rating
      end

      puts "\n"
      puts "You rated '#{song}' a #{rating.to_s} out of 5."
    end
  end

  def list_songs
    puts "\n"
    puts "Would you like to: "
    puts "1. List all songs."
    puts "2. List songs by genre."
    option = gets.chomp

    if option == "1"
      puts "\n"
      puts "Here is your playlist: "
      @songs.each do |song|
        puts song
      end

    elsif option == "2"
      puts "What music genre would you like to see? "
      genre = gets.chomp
      @songs_of_chosen_genre = []

      @songs.each do |song|
        if song.genre == genre
          @songs_of_chosen_genre.push(song)
        end
      end

      puts "Here are the songs of the #{genre} genre:"
      @songs_of_chosen_genre.each do |song|
        puts song
      end
    end
  end

end
