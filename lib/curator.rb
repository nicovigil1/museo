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
end
