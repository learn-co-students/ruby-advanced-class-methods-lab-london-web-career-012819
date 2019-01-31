class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end

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

  def self.new_by_name(song_name)
    self.new(song_name)
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    self.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)

    if song == nil
      self.create_by_name(song_name)
    else
      song
    end

  end

  def self.alphabetical
    self.all.sort do |song1, song2|
      song1.name <=> song2.name
    end
  end

  def self.new_from_filename(file_name)
    splitted = file_name.split(" - ")
    song_name = splitted[1].split(".")[0]
    artist_name = splitted[0]

    self.new(song_name, artist_name)

  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end













end
