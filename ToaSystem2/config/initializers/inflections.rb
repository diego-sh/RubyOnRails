# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
 ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'perfil', 'perfiles'
   inflect.irregular 'residencia', 'residencias'
   inflect.irregular 'consulta', 'consultas'

   inflect.irregular 'canton', 'cantones'
   inflect.irregular 'provincia', 'provincias'
   inflect.irregular 'cita', 'citas'
   inflect.irregular 'examen', 'examenes'
   inflect.irregular 'prescripcion', 'prescripciones'
   inflect.irregular 'terapia', 'terapias'
   inflect.irregular 'configuracion_habitacion', 'configuracion_habitaciones'
   inflect.irregular 'enfermeria_nota', 'enfermeria_notas'
   inflect.irregular 'nota', 'notas'
   inflect.irregular 'revision', 'revisiones'
   inflect.irregular 'protocolo_operacion', 'protocolo_operaciones'

   
   
   
#   inflect.uncountable %w( fish sheep )
 end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
