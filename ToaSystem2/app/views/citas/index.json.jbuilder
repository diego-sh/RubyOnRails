json.array!(@citas) do |cita|
    #json.extract! cita, :paciente_id, :empleado_id, :medico_id
    json.cedula cita.cedulap
    json.medico2 cita.apellidod+" "+cita.nombred
    json.fecha cita.Cit_Fecha
    json.hora cita.Cit_Hora
    json.motivo cita.Cit_Motivo
    json.className cita.cedulap
    json.medico cita.medico_id.to_s
    json.title cita.apellidop+" "+cita.nombrep
    hora = cita.Cit_Hora
    horaFin= cita.Cit_Hora_Fin
    dia = cita.Cit_Fecha
    json.start DateTime.new(dia.year, dia.month,dia.day, hora.hour,hora.min, hora.sec)
    json.end DateTime.new(dia.year, dia.month,dia.day, horaFin.hour,horaFin.min, horaFin.sec)
    json.url cita_url(cita, format: :html)
end