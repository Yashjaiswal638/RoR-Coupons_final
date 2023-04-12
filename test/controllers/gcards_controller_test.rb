require "test_helper"

class GcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gcard = gcards(:one)
  end

  test "should get index" do
    get gcards_url
    assert_response :success
  end

  test "should get new" do
    get new_gcard_url
    assert_response :success
  end

  test "should create gcard" do
    assert_difference("Gcard.count") do
      post gcards_url, params: { gcard: { amount: @gcard.amount, code: @gcard.code, description: @gcard.description, email: @gcard.email } }
    end

    assert_redirected_to gcard_url(Gcard.last)
  end

  test "should show gcard" do
    get gcard_url(@gcard)
    assert_response :success
  end

  test "should get edit" do
    get edit_gcard_url(@gcard)
    assert_response :success
  end

  test "should update gcard" do
    patch gcard_url(@gcard), params: { gcard: { amount: @gcard.amount, code: @gcard.code, description: @gcard.description, email: @gcard.email } }
    assert_redirected_to gcard_url(@gcard)
  end

  test "should destroy gcard" do
    assert_difference("Gcard.count", -1) do
      delete gcard_url(@gcard)
    end

    assert_redirected_to gcards_url
  end
end
