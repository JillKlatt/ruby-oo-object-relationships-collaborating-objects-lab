require 'artist'

class Song

    attr_accessor :name, :artist
    SONGS = []
    @@all = []

    def initialize(name)
        @name = name
        SONGS << name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(name)
        # song = Song.new(name)
        # # SONGS << song
        # song.artist = self
        song = name.split(" - ")[1]
        artist = name.split(" - ")[0]
        song_name = self.new(song)
        song_name.artist_name = artist
        song_name
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end