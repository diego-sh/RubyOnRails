$(document).on 'turbolinks:load', ->
    $('#tblUsuarios').dataTable({
      "language": {
        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
      }
    })