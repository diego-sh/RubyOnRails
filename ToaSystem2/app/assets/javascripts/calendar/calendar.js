var initialize_calendar;
var initialLangCode = 'es';
initialize_calendar = function(){
    $('#citas_selector').change(function(){
        $('.calendar').fullCalendar('rerenderEvents');
    });
    $('.calendar').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({
            events: '/citas.json',
            header:{
                left: 'prev, next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            buttonText: {
                today: 'HOY',
                day: 'DIARIO',
                week:'SEMANAL',
                month:'MENSUAL'
            },
            monthNames: ["ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE"],
            monthNamesShort: ["ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DEC"],
            dayNames: ["DOMINGO","LUNES","MARTES","MIERCOLES","JUEVES","VIERNES","SABADO"],
            dayNamesShort: ["DOM","LUN","MAR","MIE","JUE","VIE","SAB"],
            prev: "&nbsp;&#9668;&nbsp;",
            next: "&nbsp;&#9658;&nbsp;",
            prevYear: "&nbsp;&lt;&lt;&nbsp;",
            nextYear: "&nbsp;&gt;&gt;&nbsp;",
            lang: initialLangCode,
            selectable: true,
            selectHelper: true,
            editable: true,
            eventLimit: true,
            eventRender: function eventRender( event, element, view ) {
                return ['', event.url].indexOf($('#citas_selector').val()) >= 0
            }
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);