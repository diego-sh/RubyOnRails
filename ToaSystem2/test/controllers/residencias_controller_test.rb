require 'test_helper'

class ResidenciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @residencia = residencias(:one)
  end

  test "should get index" do
    get residencias_url
    assert_response :success
  end

  test "should get new" do
    get new_residencia_url
    assert_response :success
  end

  test "should create residencia" do
    assert_difference('Residencia.count') do
      post residencias_url, params: { residencia: { Res_Calle_Principal: @residencia.Res_Calle_Principal, Res_Calle_Secundaria: @residencia.Res_Calle_Secundaria, Res_Canton: @residencia.Res_Canton, Res_Numero_Casa: @residencia.Res_Numero_Casa, Res_Provincia: @residencia.Res_Provincia, Res_Sector: @residencia.Res_Sector, actualizado_at: @residencia.actualizado_at, creado_at: @residencia.creado_at, paciente_id: @residencia.paciente_id, user_id: @residencia.user_id } }
    end

    assert_redirected_to residencia_url(Residencia.last)
  end

  test "should show residencia" do
    get residencia_url(@residencia)
    assert_response :success
  end

  test "should get edit" do
    get edit_residencia_url(@residencia)
    assert_response :success
  end

  test "should update residencia" do
    patch residencia_url(@residencia), params: { residencia: { Res_Calle_Principal: @residencia.Res_Calle_Principal, Res_Calle_Secundaria: @residencia.Res_Calle_Secundaria, Res_Canton: @residencia.Res_Canton, Res_Numero_Casa: @residencia.Res_Numero_Casa, Res_Provincia: @residencia.Res_Provincia, Res_Sector: @residencia.Res_Sector, actualizado_at: @residencia.actualizado_at, creado_at: @residencia.creado_at, paciente_id: @residencia.paciente_id, user_id: @residencia.user_id } }
    assert_redirected_to residencia_url(@residencia)
  end

  test "should destroy residencia" do
    assert_difference('Residencia.count', -1) do
      delete residencia_url(@residencia)
    end

    assert_redirected_to residencias_url
  end
end
