json.extract! appointment, :id, :MED_PER_ID, :PAC_ID, :PER_ID, :CIT_FECHA, :CIT_HORA, :CIT_ESTADO, :CIT_TIPO, :FECHA_CREACION, :FECHA_ACTUALIZACION, :ID_USUARIO_CREACION, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)