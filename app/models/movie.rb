require 'httparty'

class Movie
  attr_reader :results

  def initialize(movie_name)
    @web_string = "http://www.omdbapi.com/?t=#{movie_name}&tomatoes=true"
    @results = HTTParty.get(@web_string)
    # p @movie_info
  end

  def title
    @title = @results["Title"]
  end

  def rating
    @rating = @results["tomatoMeter"]
  end
end

# movie = Movie.new("day")
