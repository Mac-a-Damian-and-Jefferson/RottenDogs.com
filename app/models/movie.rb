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

  def dog_rating
    if (0..40).to_a.include?(@rating)
      @dog_rating = "saddog"
    elsif (41..69).to_a.include?(@rating)
      @dog_rating = "seriousdog"
    else
      @dog_rating = "happydog"
    end
    @dog_rating
  end

  def plot
    p @results
    @plot = @results["Plot"]
  end
end
