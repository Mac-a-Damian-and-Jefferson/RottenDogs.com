require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get search with one params" do
    get :search, movie_name: "Cloud Atlas"
    assert_response :success
  end

  test "should get search with zero params" do
    get :search
    assert_response :success
  end

end
