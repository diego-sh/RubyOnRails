require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post patients_url, params: { patient: { FECHA_ACTUALIZACION: @patient.FECHA_ACTUALIZACION, FECHA_CREACION: @patient.FECHA_CREACION, ID_USUARIO_CREACION: @patient.ID_USUARIO_CREACION, PAC_APELLIDO_MATERNO: @patient.PAC_APELLIDO_MATERNO, PAC_APELLIDO_PATERNO: @patient.PAC_APELLIDO_PATERNO, PAC_CEDULA: @patient.PAC_CEDULA, PAC_ESTADO_CIVIL: @patient.PAC_ESTADO_CIVIL, PAC_FECHA_NACIMIENTO: @patient.PAC_FECHA_NACIMIENTO, PAC_GENERO: @patient.PAC_GENERO, PAC_GRUPO_SANGUINEO: @patient.PAC_GRUPO_SANGUINEO, PAC_HC: @patient.PAC_HC, PAC_INSTRUCCION: @patient.PAC_INSTRUCCION, PAC_NACIONALIDAD: @patient.PAC_NACIONALIDAD, PAC_NOMBRES: @patient.PAC_NOMBRES, PAC_OCUPACION: @patient.PAC_OCUPACION, PAC_TELEFONO: @patient.PAC_TELEFONO } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { FECHA_ACTUALIZACION: @patient.FECHA_ACTUALIZACION, FECHA_CREACION: @patient.FECHA_CREACION, ID_USUARIO_CREACION: @patient.ID_USUARIO_CREACION, PAC_APELLIDO_MATERNO: @patient.PAC_APELLIDO_MATERNO, PAC_APELLIDO_PATERNO: @patient.PAC_APELLIDO_PATERNO, PAC_CEDULA: @patient.PAC_CEDULA, PAC_ESTADO_CIVIL: @patient.PAC_ESTADO_CIVIL, PAC_FECHA_NACIMIENTO: @patient.PAC_FECHA_NACIMIENTO, PAC_GENERO: @patient.PAC_GENERO, PAC_GRUPO_SANGUINEO: @patient.PAC_GRUPO_SANGUINEO, PAC_HC: @patient.PAC_HC, PAC_INSTRUCCION: @patient.PAC_INSTRUCCION, PAC_NACIONALIDAD: @patient.PAC_NACIONALIDAD, PAC_NOMBRES: @patient.PAC_NOMBRES, PAC_OCUPACION: @patient.PAC_OCUPACION, PAC_TELEFONO: @patient.PAC_TELEFONO } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end
end
