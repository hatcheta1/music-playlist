require_relative "song"

class Playlist
  def initialize
    @songs = []
  end

  def run
    input = 0

    while input != "4" do
      puts "\nWelcome to your playlist!"
      puts "1. Add a song"
      puts "2. List songs"
      puts "3. Shuffle playlist"
      puts "4. Rate a song"
      puts "5. Quit"
      puts "Choose an option: "

      input = gets.chomp

      if input == "1"
        add_song

      elsif input == "2"
        list_songs

      elsif input == "3"
        shuffle_playlist

      elsif input == "4"
        rate_song

      elsif input == "5"
        puts "\nThank you for creating your playlist. Goodbye!"

      else
        puts "\nInvalid input. Please try again."
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

  def list_songs
    puts "\n"
    puts "Would you like to: "
    puts "1. List all songs."
    puts "2. List songs by genre."
    option = gets.chomp

    if option == "1"
      puts "\nHere is your playlist: "
      @songs.each do |song|
        puts song
      end

    elsif option == "2"
      puts "\nWhat music genre would you like to see? "
      genre = gets.chomp
      @songs_of_chosen_genre = []
      
      # If a song has the chosen genre, add it to the list
      @songs.each do |song|
        if song.genre == genre
          @songs_of_chosen_genre.push(song)
        end
      end

      # If the list is empty, there are no songs of that genre on the current playlist
      if @songs_of_chosen_genre.count == 0
        puts "\nThere are no songs of your chosen genre on the playlist."

      # If the list is not empty, display each song on the list
      else
        puts "\nHere are the songs of your chosen genre (#{genre}):"
        @songs_of_chosen_genre.each do |song|
          puts song
      end
    end

    # If the user enters a number besides 1 or 2, prompt them to try again
    else
      puts "\nInvalid input. Please try again."
    end
  end

  def shuffle_playlist
    puts "\nHere is your shuffled playlist:"
    @songs = @songs.shuffle!

    @songs.each do |song|
      puts song
    end
  end

  def rate_song
    print "What song would you like to rate? "
    song_name = gets.chomp

    song = @songs.find { |s| s.name == song_name }

    if song.nil?
      puts "\nSong not found in the playlist. Please try again."
      return
    end

    print "What is your rating of this song (out of 5)? "
    rating = gets.chomp.to_i

    if rating < 1 || rating > 5
      puts "Invalid rating. Please try again."
      return
    end

    song.rating = rating
    puts "\nYou rated '#{song.name}' a #{rating} out of 5."
  end

end
