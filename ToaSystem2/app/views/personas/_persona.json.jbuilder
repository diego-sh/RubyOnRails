json.extract! persona, :id, :Per_Cedula, :Per_Apellido_Paterno, :Per_Apellido_Materno, :Per_Nombres, :Per_Fecha_Nacimiento, :Per_Telefono, :created_at, :updated_at
json.url persona_url(persona, format: :json)
