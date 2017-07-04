json.array!(@partesOperatorios) do |parteOperatorio|
    json.paciente parteOperatorio.Pac_Apellido_Paterno+" "+parteOperatorio.Pac_Nombres
    json.id parteOperatorio.partes_operatorio_id
    json.cirugia parteOperatorio.Pop_Cirugia_Propuesta
    json.title parteOperatorio.Pac_Apellido_Paterno+" "+parteOperatorio.Pac_Nombres+"\n"+ parteOperatorio.Pop_Cirugia_Propuesta
    hora = parteOperatorio.Pop_Hora_Cirugia
    horaFin= parteOperatorio.Pop_Tiempo_Cirugia
    dia = parteOperatorio.Pop_Fecha_Cirugia
    json.start DateTime.new(dia.year, dia.month,dia.day, hora.hour,hora.min, hora.sec)
    json.end DateTime.new(dia.year, dia.month,dia.day, horaFin.hour,horaFin.min, horaFin.sec)
    #json.url cita_url(cita, format: :html)
end