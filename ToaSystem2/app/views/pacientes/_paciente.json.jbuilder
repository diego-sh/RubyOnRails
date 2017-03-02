json.extract! paciente, :id, :Pac_HC, :Pac_Cedula, :Pac_Pasaporte, :Pac_Apellido_Paterno, :Pac_Apellido_Materno, :Pac_Nombres, :Pac_Fecha_Nacimiento, :Pac_Nacionalidad, :Pac_Genero, :Pac_Estado_Civil, :Pac_Instruccion, :Pac_Ocupacion, :Pac_Telefono, :Pac_Grupo_Sanguineo, :creado_at, :actualizado_at, :user_id, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
