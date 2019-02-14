require 'pry'

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
    song = Song.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by { |song| song.name }
    sorted
  end



  def self.new_from_filename(filename)
    split = filename.split(" - ")
    artist_name = split[0]
    name = split[1].gsub(".mp3", "")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split = filename.split(" - ")
    artist_name = split[0]
    name = split[1].gsub(".mp3", "")
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end



  end
