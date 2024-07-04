class Song
  attr_accessor :title, :artist, :genre, :rating

  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def to_s
    "#{title} by #{artist}"
  end

end
