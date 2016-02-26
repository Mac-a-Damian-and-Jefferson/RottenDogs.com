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
    @rating = @results["tomatoMeter"].to_i
    end

  def dog_rating
    if (0..40).to_a.include?(@rating)
      @dog_rating = "saddog"
      @dog_display_emoji = "Ruh Roh!"
    elsif (41..69).to_a.include?(@rating)
      @dog_rating = "seriousdog"
      @dog_display_emoji = "Meh!"
  else
      @dog_rating = "happydog"
      @dog_display_emoji = "4 Paws Up!"
    end
    @dog_display_emoji
  end

  def plot
    p @results
    @plot = @results["Plot"]
  end

  def picture_link
    @picture_link = Photo.new(@dog_rating).picture_link
  end
end
