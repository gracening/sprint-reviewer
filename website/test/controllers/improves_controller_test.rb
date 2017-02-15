require 'test_helper'

class ImprovesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @improfe = improves(:one)
  end

  test "should get index" do
    get improves_url, as: :json
    assert_response :success
  end

  test "should create improfe" do
    assert_difference('Improve.count') do
      post improves_url, params: { improfe: { author: @improfe.author, body: @improfe.body, date: @improfe.date, id: @improfe.id, team: @improfe.team } }, as: :json
    end

    assert_response 201
  end

  test "should show improfe" do
    get improfe_url(@improfe), as: :json
    assert_response :success
  end

  test "should update improfe" do
    patch improfe_url(@improfe), params: { improfe: { author: @improfe.author, body: @improfe.body, date: @improfe.date, id: @improfe.id, team: @improfe.team } }, as: :json
    assert_response 200
  end

  test "should destroy improfe" do
    assert_difference('Improve.count', -1) do
      delete improfe_url(@improfe), as: :json
    end

    assert_response 204
  end
end
