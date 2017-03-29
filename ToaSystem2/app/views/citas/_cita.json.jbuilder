json.extract! cita, :id, :paciente_id, :empleado_id, :medico_id, :Cit_Fecha, :Cit_Hora, :Cit_Motivo, :Cit_Estado, :Cit_Observacion, :created_at, :updated_at
json.url cita_url(cita, format: :json)
