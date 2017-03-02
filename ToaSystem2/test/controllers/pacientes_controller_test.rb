require 'test_helper'

class PacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paciente = pacientes(:one)
  end

  test "should get index" do
    get pacientes_url
    assert_response :success
  end

  test "should get new" do
    get new_paciente_url
    assert_response :success
  end

  test "should create paciente" do
    assert_difference('Paciente.count') do
      post pacientes_url, params: { paciente: { Pac_Apellido_Materno: @paciente.Pac_Apellido_Materno, Pac_Apellido_Paterno: @paciente.Pac_Apellido_Paterno, Pac_Cedula: @paciente.Pac_Cedula, Pac_Estado_Civil: @paciente.Pac_Estado_Civil, Pac_Fecha_Nacimiento: @paciente.Pac_Fecha_Nacimiento, Pac_Genero: @paciente.Pac_Genero, Pac_Grupo_Sanguineo: @paciente.Pac_Grupo_Sanguineo, Pac_HC: @paciente.Pac_HC, Pac_Instruccion: @paciente.Pac_Instruccion, Pac_Nacionalidad: @paciente.Pac_Nacionalidad, Pac_Nombres: @paciente.Pac_Nombres, Pac_Ocupacion: @paciente.Pac_Ocupacion, Pac_Pasaporte: @paciente.Pac_Pasaporte, Pac_Telefono: @paciente.Pac_Telefono, actualizado_at: @paciente.actualizado_at, creado_at: @paciente.creado_at, user_id: @paciente.user_id } }
    end

    assert_redirected_to paciente_url(Paciente.last)
  end

  test "should show paciente" do
    get paciente_url(@paciente)
    assert_response :success
  end

  test "should get edit" do
    get edit_paciente_url(@paciente)
    assert_response :success
  end

  test "should update paciente" do
    patch paciente_url(@paciente), params: { paciente: { Pac_Apellido_Materno: @paciente.Pac_Apellido_Materno, Pac_Apellido_Paterno: @paciente.Pac_Apellido_Paterno, Pac_Cedula: @paciente.Pac_Cedula, Pac_Estado_Civil: @paciente.Pac_Estado_Civil, Pac_Fecha_Nacimiento: @paciente.Pac_Fecha_Nacimiento, Pac_Genero: @paciente.Pac_Genero, Pac_Grupo_Sanguineo: @paciente.Pac_Grupo_Sanguineo, Pac_HC: @paciente.Pac_HC, Pac_Instruccion: @paciente.Pac_Instruccion, Pac_Nacionalidad: @paciente.Pac_Nacionalidad, Pac_Nombres: @paciente.Pac_Nombres, Pac_Ocupacion: @paciente.Pac_Ocupacion, Pac_Pasaporte: @paciente.Pac_Pasaporte, Pac_Telefono: @paciente.Pac_Telefono, actualizado_at: @paciente.actualizado_at, creado_at: @paciente.creado_at, user_id: @paciente.user_id } }
    assert_redirected_to paciente_url(@paciente)
  end

  test "should destroy paciente" do
    assert_difference('Paciente.count', -1) do
      delete paciente_url(@paciente)
    end

    assert_redirected_to pacientes_url
  end
end
