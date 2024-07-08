class Song
  attr_accessor :name, :artist, :genre, :rating

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @rating = rating
  end

  def to_s
    if @rating
      "#{@name} by #{@artist} (#{@genre}) - Rating: #{@rating}/5"
    else
      "#{name} by #{artist} (#{@genre})"
    end
  end

end
