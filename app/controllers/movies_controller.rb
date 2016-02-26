class MoviesController < ApplicationController
  def show
  end

  def search
    movie_name = @search
    m = Movie.new(movie_name)
    render json: {Title: m.title,
                  Rating: m.rating}
  end
end
