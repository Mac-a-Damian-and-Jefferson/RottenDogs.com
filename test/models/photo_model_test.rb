require 'test_helper'

class PhotoModelTest < ActionController::TestCase

  test "must pass argument in initialize" do
    assert_raises(ArgumentError) {
      Photo.new()
    }
  end

  test "new photo" do
    assert Photo.new("seriousdog")
  end

end
