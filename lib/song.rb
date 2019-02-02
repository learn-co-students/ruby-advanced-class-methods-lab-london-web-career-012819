require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(name)
    # looks for song == argument in @@all
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.map.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    arr = filename.gsub(".mp3", "").split(" - ")
    song_artist = arr[0]
    song_name = arr[1]

    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.create_from_filename(filename)
    arr = filename.gsub(".mp3", "").split(" - ")
    song_artist = arr[0]
    song_name = arr[1]

    song = self.create
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end

binding.pry
