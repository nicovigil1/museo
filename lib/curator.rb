require "./lib/photograph"
require "./lib/artist"
require "pry"

class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(attributes)
    @photographs << Photograph.new(attributes)
  end

  def add_artist(attributes)
    @artists << Artist.new(attributes)
  end

  def find_artist_by_id(artist_id)
    @artists.find do |artist|
      artist.id == artist_id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    chronic_painters = []
    @artists.each do |artist|
      if find_photographs_by_artist(artist).length > 1
        chronic_painters << artist
      end
    end
    chronic_painters
  end

  def photographs_taken_by_artists_from(nation)
    national_artists = @artists.find_all do |artist|
      artist.country == nation
    end
    answer = []
    national_artists.each do |artist|
      answer << find_photographs_by_artist(artist)
    end
    answer.flatten
  end
end
