require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "movie class exists" do
    assert Movie
  end

  test "get title" do
    m = Movie.new("The Matrix", "short")
    assert_equal "The Matrix", m.title
  end

  test "get rating" do
    m = Movie.new("The Matrix", "short")
    assert_equal 87, m.rating
  end

  test "dog rating" do
    m = Movie.new("The Matrix", "short")
    assert_equal "4 Paws Up!", m.dog_rating
  end

  test "plot" do
    m = Movie.new("The Matrix", "short")
    assert_equal "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", m.plot
  end

  test "picture link" do
    m = Movie.new("The Matrix", "short")
    assert_match /https?:\/\/[\S]/, m.picture_link
  end

end
