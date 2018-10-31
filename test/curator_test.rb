require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test
  def setup
    @curator = Curator.new
    @photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    @photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    @artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    @artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_artists_starts_as_empty_array
    assert_equal [], @curator.artists
  end

  def test_photos_starts_as_empty_array
    assert_equal [], @curator.photographs
  end

  def test_add_photo_method
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)

    assert_equal "1", @curator.photographs[0].id
    assert_equal "2", @curator.photographs[1].id
  end

  def test_add_artist_method
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)

    assert_equal "Henri Cartier-Bresson", @curator.artists[0].name
    assert_equal "Ansel Adams", @curator.artists[1].name
  end


end
