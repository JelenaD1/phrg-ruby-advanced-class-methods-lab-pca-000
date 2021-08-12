require "pry"

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
  song.save
  song
  
end 

def self.new_by_name(song_name)
  song = Song.new
  song.name = song_name
  song
 
end

def self.create_by_name(song_name)
  song = Song.new
  song.name = song_name
  song.save
  song 
end 

def self.find_by_name(song_name)
  @@all.find {|song| song.name == song_name}
end 

def self.find_or_create_by_name(name)
  find_by_name(name) || create_by_name(name)
end 

def self.alphabetical
  @@all.sort_by {|song| song.name}
end 

def self.new_from_filename(file_name)
  song = Song.new

  data = file_name.split(/\ - |\./)

  song.artist_name = data[0]
  song.name = data[1]
  
  song
end 

def self.create_from_filename(file_name)
 
  song = self.new_from_filename(file_name).save
 song
end 

def self.destroy_all
  self.all.clear
end 





end
