require 'test_helper'

class PersonarolControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get personarol_index_url
    assert_response :success
  end

  test "should get new" do
    get personarol_new_url
    assert_response :success
  end

  test "should get create" do
    get personarol_create_url
    assert_response :success
  end

  test "should get update" do
    get personarol_update_url
    assert_response :success
  end

end
