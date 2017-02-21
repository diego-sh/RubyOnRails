require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { CIT_ESTADO: @appointment.CIT_ESTADO, CIT_FECHA: @appointment.CIT_FECHA, CIT_HORA: @appointment.CIT_HORA, CIT_TIPO: @appointment.CIT_TIPO, FECHA_ACTUALIZACION: @appointment.FECHA_ACTUALIZACION, FECHA_CREACION: @appointment.FECHA_CREACION, ID_USUARIO_CREACION: @appointment.ID_USUARIO_CREACION, MED_PER_ID: @appointment.MED_PER_ID, PAC_ID: @appointment.PAC_ID, PER_ID: @appointment.PER_ID } }
    end

    assert_redirected_to appointment_url(Appointment.last)
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_url(@appointment)
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { CIT_ESTADO: @appointment.CIT_ESTADO, CIT_FECHA: @appointment.CIT_FECHA, CIT_HORA: @appointment.CIT_HORA, CIT_TIPO: @appointment.CIT_TIPO, FECHA_ACTUALIZACION: @appointment.FECHA_ACTUALIZACION, FECHA_CREACION: @appointment.FECHA_CREACION, ID_USUARIO_CREACION: @appointment.ID_USUARIO_CREACION, MED_PER_ID: @appointment.MED_PER_ID, PAC_ID: @appointment.PAC_ID, PER_ID: @appointment.PER_ID } }
    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_url
  end
end
