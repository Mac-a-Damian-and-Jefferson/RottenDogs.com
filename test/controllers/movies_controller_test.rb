require 'test_helper'
# class Movie
#   def initialize(movie_name, plot_size)
#     # @web_string = JSON.parse(File.read("movies_controller.json"))
#     @results = File.read("movies_controller.json")
#   end
# end

class MoviesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get search with one params" do
    get :search, movie_name: "T"
    assert_response :success
  end

  test "should get search with zero params" do
    get :search
    assert_response :success
  end

end
