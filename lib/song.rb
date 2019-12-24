class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

   def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical 
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    song = Song.new_by_name(song_name.split(".")[0])
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    song = Song.create_by_name(song_name.split(".")[0])
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
