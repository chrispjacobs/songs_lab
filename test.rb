class Artist
    attr_accessor :name
    def initialize(name)
      @name = name
      @songs_array = []
    end
    def songs
      @songs_array
    end
    def add_song(song_variable)
      @songs_array << song_variable
      if song_variable.artist == nil
        song_variable.artist = self
      end
    end
    def add_song_by_name(name_string)
      new_song_variable = Song.new
      new_song_variable.name = name_string
      if new_song_variable.artist == nil
        new_song_variable.artist = self     # Why doesn't this line function properly? (See failure of "puts" on line 55.)
      end
    end
    def song_count
      @songs_array.count
    end
  end

  class Song
    @@all = []
    attr_accessor :name, :artist
    def initialize(name)
      @name = name
      @@all << self
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.all
      @@all
    end
    def artist_name
      if self.artist != nil
        if self.artist.name != nil
          self.artist.name
        end
      else
        nil
      end
    end
  end

the_beatles = Artist.new("The Beatles")
help = Song.new("Help!")
puts "help.artist returns #{help.artist}"
the_beatles.add_song(help)
puts "the_beatles.songs returns #{the_beatles.songs}"
puts "help.artist now returns #{help.artist}"
