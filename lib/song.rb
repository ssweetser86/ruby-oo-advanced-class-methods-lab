class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.each do |s|
      return s if s.name == name
    end
    nil
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name(name) unless !self.find_by_name(name)
    self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    song = self.new
    file_new = file.delete_suffix!(".mp3").split(" - ")
    song.name = file_new[1]
    song.artist_name = file_new[0]
    return song
  end

  def self.create_from_filename(file)
    song = self.new
    file_new = file.delete_suffix!(".mp3").split(" - ")
    song.name = file_new[1]
    song.artist_name = file_new[0]
    song.save
    return song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
