require 'test_helper'

class ConsultasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consultas_index_url
    assert_response :success
  end

  test "should get edit" do
    get consultas_edit_url
    assert_response :success
  end

  test "should get new" do
    get consultas_new_url
    assert_response :success
  end

  test "should get create" do
    get consultas_create_url
    assert_response :success
  end

  test "should get update" do
    get consultas_update_url
    assert_response :success
  end

end
