require 'test_helper'

class CitasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cita = citas(:one)
  end

  test "should get index" do
    get citas_url
    assert_response :success
  end

  test "should get new" do
    get new_cita_url
    assert_response :success
  end

  test "should create cita" do
    assert_difference('Cita.count') do
      post citas_url, params: { cita: { Cit_Estado: @cita.Cit_Estado, Cit_Fecha: @cita.Cit_Fecha, Cit_Hora: @cita.Cit_Hora, Cit_Motivo: @cita.Cit_Motivo, Cit_Observacion: @cita.Cit_Observacion, empleado_id: @cita.empleado_id, medico_id: @cita.medico_id, paciente_id: @cita.paciente_id } }
    end

    assert_redirected_to cita_url(Cita.last)
  end

  test "should show cita" do
    get cita_url(@cita)
    assert_response :success
  end

  test "should get edit" do
    get edit_cita_url(@cita)
    assert_response :success
  end

  test "should update cita" do
    patch cita_url(@cita), params: { cita: { Cit_Estado: @cita.Cit_Estado, Cit_Fecha: @cita.Cit_Fecha, Cit_Hora: @cita.Cit_Hora, Cit_Motivo: @cita.Cit_Motivo, Cit_Observacion: @cita.Cit_Observacion, empleado_id: @cita.empleado_id, medico_id: @cita.medico_id, paciente_id: @cita.paciente_id } }
    assert_redirected_to cita_url(@cita)
  end

  test "should destroy cita" do
    assert_difference('Cita.count', -1) do
      delete cita_url(@cita)
    end

    assert_redirected_to citas_url
  end
end
