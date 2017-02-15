require 'test_helper'

class BadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bad = bads(:one)
  end

  test "should get index" do
    get bads_url, as: :json
    assert_response :success
  end

  test "should create bad" do
    assert_difference('Bad.count') do
      post bads_url, params: { bad: { author: @bad.author, body: @bad.body, date: @bad.date, id: @bad.id, team: @bad.team } }, as: :json
    end

    assert_response 201
  end

  test "should show bad" do
    get bad_url(@bad), as: :json
    assert_response :success
  end

  test "should update bad" do
    patch bad_url(@bad), params: { bad: { author: @bad.author, body: @bad.body, date: @bad.date, id: @bad.id, team: @bad.team } }, as: :json
    assert_response 200
  end

  test "should destroy bad" do
    assert_difference('Bad.count', -1) do
      delete bad_url(@bad), as: :json
    end

    assert_response 204
  end
end
