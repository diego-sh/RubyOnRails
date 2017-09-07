json.array!(@cirugias) do |cirugia|
    json.title cirugia.Pop_Cirugia_Propuesta
    #json.extract! cita, :paciente_id, :empleado_id, :medico_id
    #json.cedula cita.cedulap
    #json.className cita.cedulap
    #json.medico cita.medico_id.to_s
    #json.title cita.apellidop+" "+cita.nombrep
    hora = cirugia.Pop_Hora_Cirugia
    duracion = cirugia.Pop_Tiempo_Cirugia
    #horaFin= cita.Cit_Hora_Fin
    dia = cirugia.Pop_Fecha_Cirugia
    json.start DateTime.new(dia.year, dia.month,dia.day, hora.hour,hora.min, hora.sec)
    json.end DateTime.new(dia.year, dia.month,dia.day, hora.hour+duracion.hour,hora.min+duracion.min, hora.sec+duracion.sec)
end