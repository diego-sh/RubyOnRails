var initialize_calendar;
var initialLangCode = 'es';
var filtro = true;

function filtroPaciente(){
    filtro = false;
    $('.calendar').fullCalendar('rerenderEvents');
}

initialize_calendar = function(){
    $('#citas_selector').change(function(){
        filtro = true;
        $('.calendar').fullCalendar('rerenderEvents');
    });
    $('#paciente').keyup(function(event){
        if(event.keyCode == 13){
            filtro = false;
            $('.calendar').fullCalendar('rerenderEvents');
        }
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
            //defaultView: 'agendaDay',
            scrollTime: '09:00',
            businessHours: {
                start: '9:00',
                end: '18:00',
            },
            lang: 'es',
            editable: false,
            selectable: false,
            allDaySlot: false,
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
                switch(event.medico) {
                    case "1":
                        element.css('background-color', '#0000ff');
                        element.css('border-color',  '#0000ff');
                        break;
                    case "2":
                        element.css('background-color', '#cc00cc');
                        element.css('border-color',  '#cc00cc');
                        break;
                    case "3":
                        element.css('background-color', '#ffff00');
                        element.css('border-color',  '#ffff00');
                        break;
                    case "4":
                        element.css('background-color', '#ff0066');
                        element.css('border-color',  '#ff0066');
                        break;
                    case "5":
                        element.css('background-color', '#00b300');
                        element.css('border-color',  '#00b300');
                        break;
                    case "6":
                        element.css('background-color', '#ff8000');
                        element.css('border-color',  '#ff8000');
                        break;
                    case "7":
                        element.css('background-color', '#999966');
                        element.css('border-color',  '#999966');
                        break;
                    case "8":
                        element.css('background-color', '#ffcc99');
                        element.css('border-color',  '#ffcc99');
                        break;
                    case "9":
                        element.css('background-color', '#cc00cc');
                        element.css('border-color',  '#cc00cc');
                        break;
                    case "10":
                        element.css('background-color', '#cc6600');
                        element.css('border-color',  '#cc6600');
                        break;
                    default:
                        element.css('background-color', '#000');
                        element.css('border-color',  '#000');
                }
                if(filtro == true){
                    return ['', event.medico].indexOf($('#citas_selector').val()) >= 0
                }else{
                    return ['', event.cedula].indexOf($('#paciente').val()) >= 0
                }
            }
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);