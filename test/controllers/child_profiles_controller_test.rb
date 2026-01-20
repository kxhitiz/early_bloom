require "test_helper"

class ChildProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get child_profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get child_profiles_create_url
    assert_response :success
  end

  test "should get edit" do
    get child_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get child_profiles_update_url
    assert_response :success
  end
end
