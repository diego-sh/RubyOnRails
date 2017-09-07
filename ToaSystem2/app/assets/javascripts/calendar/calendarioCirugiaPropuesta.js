var initialize_calendar;
var initialLangCode = 'es';

initialize_calendar = function(){
    $('.calendarioCirugiaPropuesta').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({
            events: '/cirugias.json',
            timeFormat: 'H:mm',
            header:{
                left: 'prev, next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            eventClick:  function(event, jsEvent, view) {
                $('#infoPaciente').html(event.paciente);
                $('#cirugiaPropuesta').html(event.cirugia);
                $('#pOperatorio_id').val(event.id);
                $('#pOperatorio_id').hide();
                if(event.estadoIngreso!= 'HOSPITALIZADO'){
                    $('#fullCalModal').modal();
                }
                else{
                    $('#infoPaciente2').html(event.paciente);
                    $('#cirugiaPropuesta2').html(event.cirugia);
                    $('#estado').html("EL PACIENTE YA SE ENCUENTRA "+event.estadoIngreso);
                    $('#modalInfo').modal();
                }
                
            },
            lang: 'es',
            editable: false,
            selectable: false,
            allDaySlot: false,
            lang: initialLangCode,
            selectable: true,
            selectHelper: true,
            editable: true,
            eventLimit: true,
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);