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
    s = Song.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.create
    s.name = name
    s
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    arr = []
    self.all.select do |song|
      if name == song.name
        arr << song
      end
    end
    arr.shift
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    arr = []
    arr << self.all.sort_by(&:name)
    arr.flatten
  end

  def self.new_from_filename(arg)
    arr = []
    s = self.new_by_name(arg)
    arr = s.name.split(/[[:punct:]]/)
    arr.each {|i| i.strip!}
    s.name = arr[1]
    s.artist_name = arr[0]
    s
  end
  binding.pry

  def self.create_from_filename(arg)
    self.new_from_filename(arg)
  end

  def self.destroy_all
    @@all = []
  end

end


binding.pry
