class Song
  attr_accessor :name, :artist, :genre, :rating

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
  end

  def to_s
    "#{name} by #{artist}"
  end

end
