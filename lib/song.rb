require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create()
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    !find_by_name(name)?create_by_name(name):find_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file)
    song_arr = file.split(/[-,.]/)
    title = song_arr[1].strip
    artist = song_arr[0].strip
    song = new_by_name(title)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    song_arr = file.split(/[-,.]/)
    title = song_arr[1].strip
    artist = song_arr[0].strip
    song = create_by_name(title)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

#binding.pry
