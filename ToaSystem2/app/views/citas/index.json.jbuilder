json.array!(@citas) do |cita|
    #json.extract! cita, :paciente_id, :empleado_id, :medico_id
    #titulo = cita.medico_id
    json.medico cita.medico_id.to_s
    json.title cita.apellidop+" "+cita.nombrep
    hora = cita.Cit_Hora
    dia = cita.Cit_Fecha
    json.start DateTime.new(dia.year, dia.month,dia.day, hora.hour,hora.min, hora.sec)
    json.end DateTime.new(dia.year, dia.month,dia.day, hora.hour,hora.min + 30, hora.sec)
    json.url cita_url(cita, format: :html)
end