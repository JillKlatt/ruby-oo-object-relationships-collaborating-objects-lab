require 'artist'
require 'song'

class MP3Importer
attr_accessor :path

    def initialize(path)
        # @artist = artist
        # @song = song
        @path = path
    end

    def import 
        files.each {|song| Song.new_by_filename(song)}
    end
    def files
        @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
    end
end