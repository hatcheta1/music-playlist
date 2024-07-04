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
      puts "2. List songs"
      puts "3. Shuffle playlist"
      puts "4. Quit"
      puts "Choose an option: "

      input = gets.chomp

      if input == "1"
        add_song

      elsif input == "2"
        list_songs

      elsif input == "3"
        shuffle_playlist

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

  def shuffle_playlist
    puts "Here is your shuffled playlist:"
    @songs = @songs.shuffle!

    @songs.each do |song|
      puts song
    end
  end

end
