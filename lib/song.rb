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
    song = self.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.each_with_index do |title, index|
      if title.name == name
        return @@all[index]
      end
    end
    return nil  
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    end
    return self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    song = self.new
    song.artist_name = name.chomp('.mp3').split(' - ')[0]
    song.name = name.chomp('.mp3').split(' - ')[1]
    return song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def self.destroy_all
    @@all = []
  end
end
