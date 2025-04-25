require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get games_new_url
    assert_response :success
  end

  test "should get index" do
    get games_index_url
    assert_response :success
  end

  test "should get show" do
    get games_show_url
    assert_response :success
  end

  test "should get game_review" do
    get games_game_review_url
    assert_response :success
  end
end
