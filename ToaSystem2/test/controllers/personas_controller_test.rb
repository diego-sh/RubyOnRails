require 'test_helper'

class PersonasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @persona = personas(:one)
  end

  test "should get index" do
    get personas_url
    assert_response :success
  end

  test "should get new" do
    get new_persona_url
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post personas_url, params: { persona: { Per_Apellido_Materno: @persona.Per_Apellido_Materno, Per_Apellido_Paterno: @persona.Per_Apellido_Paterno, Per_Cedula: @persona.Per_Cedula, Per_Fecha_Nacimiento: @persona.Per_Fecha_Nacimiento, Per_Nombres: @persona.Per_Nombres, Per_Telefono: @persona.Per_Telefono } }
    end

    assert_redirected_to persona_url(Persona.last)
  end

  test "should show persona" do
    get persona_url(@persona)
    assert_response :success
  end

  test "should get edit" do
    get edit_persona_url(@persona)
    assert_response :success
  end

  test "should update persona" do
    patch persona_url(@persona), params: { persona: { Per_Apellido_Materno: @persona.Per_Apellido_Materno, Per_Apellido_Paterno: @persona.Per_Apellido_Paterno, Per_Cedula: @persona.Per_Cedula, Per_Fecha_Nacimiento: @persona.Per_Fecha_Nacimiento, Per_Nombres: @persona.Per_Nombres, Per_Telefono: @persona.Per_Telefono } }
    assert_redirected_to persona_url(@persona)
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete persona_url(@persona)
    end

    assert_redirected_to personas_url
  end
end
