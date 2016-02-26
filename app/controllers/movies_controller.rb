class MoviesController < ApplicationController
  def show
  end

  def search
    movie_name = params["movie_name"]
    m = Movie.new(movie_name)
    render json: {Title: m.title,
                  Plot:   m.plot,
                  TomatoMeter: m.rating,
                  DogMeter: m.dog_rating}
  end
end
