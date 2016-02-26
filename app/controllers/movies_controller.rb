class MoviesController < ApplicationController
  def show
  end

  def search
    movie_name = params["movie_name"]
    plot_size = params["plot_size"]
    m = Movie.new(movie_name, plot_size)
    if movie_name
      render json: {Title: m.title,
                    Plot:   m.plot,
                    TomatoMeter: m.rating,
                    DogMeter: m.dog_rating,
                    DogMeterEmoji: m.picture_link}
    else
      render json: "Ruh roh!! Your movie was not found! Try again."
    end
  end
end
