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
    @photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    @photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
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
    @artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    @curator_2 = Curator.new
    @curator_2.add_photograph(@photo_1)
    @curator_2.add_photograph(@photo_2)
    @curator_2.add_photograph(@photo_3)
    @curator_2.add_photograph(@photo_4)
    @curator_2.add_artist(@artist_1)
    @curator_2.add_artist(@artist_2)
    @curator_2.add_artist(@artist_3)
    @Henri = @curator_2.artists[0]
    @Ansel = @curator_2.artists[1]
    @Diane = @curator_2.artists[2]
    @photo_1_object = @curator_2.photographs[0]
    @photo_2_object = @curator_2.photographs[1]
    @photo_3_object = @curator_2.photographs[2]
    @photo_4_object = @curator_2.photographs[3]
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

  def test_it_can_find_artist_by_id
    assert_equal @Ansel, @curator_2.find_artist_by_id("2")
  end

  def test_it_can_find_photographs_by_artist
    assert_equal [@photo_3_object, @photo_4_object], @curator_2.find_photographs_by_artist(@Diane)
  end

  def test_it_can_find_artist_with_multiple_photos
    assert_equal [@Diane], @curator_2.artists_with_multiple_photographs
    assert_equal 1, @curator_2.artists_with_multiple_photographs.length
  end

  def test_it_can_find_photos_by_country_of_photographers_origin
    assert_equal [@photo_2_object, @photo_3_object, @photo_4_object], @curator_2.photographs_taken_by_artists_from("United States")
    assert_equal [],  @curator_2.photographs_taken_by_artists_from("Venezuela")
  end

  def test_it_can_take_photos_from_csv
    curator = Curator.new
    curator.load_photographs('./data/photographs.csv')
    assert (curator.photographs.length > 0)
  end

  def test_it_can_take_artists_from_csv
    curator = Curator.new
    curator.load_artists('./data/artists.csv')

    assert (curator.artists.length > 0)
  end



end
