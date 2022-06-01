class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def initialize(name="", artist_name="")
    @name=name
    @artist_name=artist_name
  end

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def self.find_by_name(name_given)
    @@all.select{|song| song.name == name_given}[0]
  end

  def self.find_or_create_by_name(name_given)
    Song.create_by_name(name_given)
    Song.find_by_name(name_given)
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name}
  end

  def self.create_from_filename(filename)
    filename_split = filename.split(/[-.]/)
    new=Song.create_by_name(filename_split[1].strip)
    new.artist_name=filename_split[0].strip
  end

  def self.new_from_filename(filename)
    filename_split = filename.split(/[-.]/)
    Song.new(filename_split[1].strip, filename_split[0].strip)
  end

  def self.destroy_all
    @@all=[]
  end



  def save
    self.class.all << self
  end

end
