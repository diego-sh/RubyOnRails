var initialize_calendar;
var initialLangCode = 'es';

initialize_calendar = function(){
    $('.calendariocirugia').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({
            events: '',
            header:{
                left: 'prev, next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
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