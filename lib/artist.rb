require 'song'
require 'pry'


class Artist
    attr_accessor :name
    @@song_count = 0
    # @@songs = []
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []

    end

    def self.all
        @@all
    end
    
    def add_song(song)
    @songs << song
    song.artist = self
    @@song_count += 1
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        # if self.songs == self
        existing_artist = self.all.find {|artist| artist.name == artist_name}
        if existing_artist
            return existing_artist
        else
            new_artist = self.new(artist_name)
            new_artist
        end
        # if @artist == nil
        #     return nil
        # else
        #     artist.name
        # end
    end
    def print_songs
        @songs.each {|song| puts song.name}
    end

end