require 'httparty'

class Movie
  attr_reader :results

  def initialize(movie_name)
    @web_string = "http://www.omdbapi.com/?t=#{movie_name}&tomatoes=true&type=movie&plot=short&r=json"
    @results = HTTParty.get(@web_string)
  end

  def title
    @title = @results["Title"]
  end

  def rating
    @rating = @results["tomatoMeter"]
  end

  def plot
    p @results
    @plot = @results["Plot"]
  end
end
