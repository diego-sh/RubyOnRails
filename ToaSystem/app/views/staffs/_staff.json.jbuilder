json.extract! staff, :id, :PER_CEDULA, :PER_APELLIDOS, :PER_NOMBRES, :PER_FECHA_NACIMIENTO, :PER_TELEFONO, :FECHA_CREACION, :FECHA_ACTUALIZACION, :ID_USUARIO_CREACION, :created_at, :updated_at
json.url staff_url(staff, format: :json)