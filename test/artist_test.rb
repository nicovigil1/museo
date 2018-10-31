require 'minitest/autorun'
require 'minitest/pride'
require './lib/artist'

class ArtistTest < Minitest::Test
  def setup
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    @artist = Artist.new(attributes)
  end

  def test_it_exists
    assert_instance_of Artist, @artist
  end

  def test_they_have_id
    assert_equal "2", @artist.id
  end

  def test_they_have_a_name
    assert_equal "Ansel Adams", @artist.name
  end

  def test_they_were_born
    assert_equal "1902", @artist.born
  end

  def test_they_died
    assert_equal "1984", @artist.died 
  end

  def test_they_were_nationalistic
    assert_equal "United States", @artist.country
  end
end
