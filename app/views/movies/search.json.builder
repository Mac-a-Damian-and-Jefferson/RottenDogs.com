if @movie.movie_name
  Title: @movie.title
  Plot:  @movie.plot
  TomatoMeter: @movie.rating,
  DogMeter: @movie.dog_rating,
  DogMeterEmoji: @movie.picture_link}
else
  Error: "Ruh roh!! Your movie was not found! Try again."
end
