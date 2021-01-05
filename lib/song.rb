# require "pry"

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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(song_file)
    song_file.slice!(/[.]\w+/)
    attributes = song_file.split(" - ")
    split_artist = attributes[0]
    split_song = attributes[1]
    # binding.pry
    new_song = self.new
    new_song.name = split_song
    new_song.artist_name = split_artist
    new_song
  end

  def self.create_from_filename(song_name)
    @@all << self.new_from_filename(song_name)
  end

  def self.destroy_all
    @@all.clear
  end
  
end
