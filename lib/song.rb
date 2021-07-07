class Song
  attr_accessor :name, :artist_name
  @@all = []
  @name = name

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
@song = self.new
@song.save
@song
end

def self.new_by_name(name)
  @song = self.create
  @song.name = name
  @song
end

def self.create_by_name(name)
  @song = self.create
  @song.name = name
  @song
end

def self.find_by_name(name)
    @@all.find do |song|
    song.name == name
end
end

def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
end

def self.alphabetical
  sorted = @@all.sort_by do |song| song.name
  end
  sorted
end

def self.new_from_filename(file_name)
  song = self.create
  file_arr = file_name.split("-")
  song.artist_name = file_arr[0][0..file_arr[0].length-2]
  song.name = file_arr[1][1..file_arr[1].length-5]
  return song
end

def self.create_from_filename(file_name)
  song = self.new_from_filename(file_name)
  song.save
  song
end

def self.destroy_all
@@all = []
end

end
