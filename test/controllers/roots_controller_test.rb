require 'test_helper'

class RootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @root = roots(:one)
  end

  test "should get index" do
    get roots_url
    assert_response :success
  end

  test "should get new" do
    get new_root_url
    assert_response :success
  end

  test "should create root" do
    assert_difference('Root.count') do
      post roots_url, params: { root: {  } }
    end

    assert_redirected_to root_url(Root.last)
  end

  test "should show root" do
    get root_url(@root)
    assert_response :success
  end

  test "should get edit" do
    get edit_root_url(@root)
    assert_response :success
  end

  test "should update root" do
    patch root_url(@root), params: { root: {  } }
    assert_redirected_to root_url(@root)
  end

  test "should destroy root" do
    assert_difference('Root.count', -1) do
      delete root_url(@root)
    end

    assert_redirected_to roots_url
  end
end
