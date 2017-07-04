# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "antecedentes", primary_key: "antecedente_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "paciente_id"
    t.string   "Ant_tipo",        limit: 32
    t.string   "Ant_Descripcion", limit: 256
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
    t.index ["paciente_id"], name: "FK_REFERENCE_18", using: :btree
  end

  create_table "cantones", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text    "nombre",       limit: 65535
    t.integer "provincia_id"
    t.text    "created_at",   limit: 65535
    t.text    "updated_at",   limit: 65535
  end

  create_table "chequeos_cardiologicos", primary_key: "chequeos_cardiologico_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "ingreso_id"
    t.date     "Chc_Fecha"
    t.time     "Chc_Hora"
    t.text     "Chc_Examen_Fisico",     limit: 4294967295
    t.string   "Chc_Ritmo",             limit: 32,                                 null: false
    t.decimal  "Chc_Frecuencia",                           precision: 4, scale: 2, null: false
    t.string   "Chc_SAQRS",             limit: 32,                                 null: false
    t.string   "Chc_Onda_P",            limit: 32,                                 null: false
    t.float    "Chc_Segmento_PR",       limit: 24,                                 null: false
    t.float    "Chc_Complejo_QRS",      limit: 24,                                 null: false
    t.string   "Chc_Indice_SOCOLOV",    limit: 32,                                 null: false
    t.string   "Chc_Onda_T",            limit: 32,                                 null: false
    t.string   "Chc_Segmento_ST",       limit: 32,                                 null: false
    t.text     "Chc_Conclusiones",      limit: 4294967295,                         null: false
    t.text     "Chc_Sugerencias",       limit: 4294967295,                         null: false
    t.text     "Chc_Riesgo_Quirurgico", limit: 4294967295,                         null: false
    t.datetime "created_at"
    t.integer  "usuario_id"
    t.string   "Chc_Signo_Morris",      limit: 64
    t.string   "Chc_Segmento_QT",       limit: 64
    t.index ["ingreso_id"], name: "FK_REFERENCE_31", using: :btree
  end

  create_table "citas", primary_key: "cita_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "paciente_id"
    t.integer  "empleado_id"
    t.integer  "medico_id"
    t.date     "Cit_Fecha"
    t.time     "Cit_Hora"
    t.time     "Cit_Hora_Fin"
    t.string   "Cit_Motivo",      limit: 128
    t.string   "Cit_Estado",      limit: 16,  comment: "PENDIENTE\n            CANCELADO\n            ATENDIDO\n            EMERGENCIA\n            CONSULTA EXTRA"
    t.boolean  "Cit_Entre_Cita"
    t.string   "Cit_Observacion", limit: 128
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
    t.index ["empleado_id"], name: "FK_REFERENCE_14", using: :btree
    t.index ["medico_id"], name: "FK_REFERENCE_15", using: :btree
    t.index ["paciente_id"], name: "FK_REFERENCE_4", using: :btree
  end

  create_table "complicaciones", primary_key: "complicacion_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "protocolo_operacion_id"
    t.string "Com_Descripcion",        limit: 1024, null: false
    t.index ["protocolo_operacion_id"], name: "FK_REFERENCE_40", using: :btree
  end

  create_table "condiciones_egresos", primary_key: "condiciones_egreso_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "epicrisi_id"
    t.string  "Ceg_Descripcion", limit: 512
    t.index ["epicrisi_id"], name: "FK_REFERENCE_33", using: :btree
  end

  create_table "configuracion_habitaciones", primary_key: "configuracion_habitacion_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "Hab_Numero"
    t.string  "Hab_Estado", limit: 16
  end

  create_table "consultas", primary_key: "consulta_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "cita_id"
    t.string   "Con_Cronologia",        limit: 256
    t.text     "Con_Diagnostico_Final", limit: 4294967295
    t.string   "Con_Codigo_CIE",        limit: 16
    t.string   "Con_Observacion",       limit: 256
    t.string   "Con_Motivo",            limit: 512
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
    t.index ["cita_id"], name: "FK_REFERENCE_3", using: :btree
  end

  create_table "diagnosticos", primary_key: "diagnostico_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "sintoma_id"
    t.integer "consulta_id"
    t.string  "Diagnostico_Presuntivo", limit: 512
    t.string  "Codigo_CIE",             limit: 16
    t.index ["consulta_id"], name: "FK_REFERENCE_6", using: :btree
    t.index ["sintoma_id"], name: "FK_REFERENCE_5", using: :btree
  end

  create_table "empleados", primary_key: "empleado_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "persona_id"
    t.string  "Emp_Rol",    limit: 32, null: false
    t.index ["persona_id"], name: "FK_REFERENCE_13", using: :btree
  end

  create_table "enfermeria_notas", primary_key: "enfermeria_nota_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "empleado_id"
    t.bigint   "ingreso_id"
    t.date     "Nde_Fecha",                      null: false
    t.time     "Nde_Hora",                       null: false
    t.text     "Nde_Nota",    limit: 4294967295, null: false
    t.datetime "created_at"
    t.integer  "usuario_id"
    t.index ["empleado_id"], name: "FK_REFERENCE_42", using: :btree
    t.index ["ingreso_id"], name: "FK_REFERENCE_43", using: :btree
  end

  create_table "epicrisis", primary_key: "epicrisi_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "ingreso_id"
    t.string "Epi_Resumen_CuadroClinico",      limit: 512
    t.string "Epi_Tipo_Egreso",                limit: 2
    t.string "Epi_Resumen_Evo_Complicaciones", limit: 512
    t.string "Epi_Resumen_Tratamiento",        limit: 512
    t.index ["ingreso_id"], name: "FK_REFERENCE_32", using: :btree
  end

  create_table "equipos", primary_key: ["partes_operatorio_id", "persona_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "partes_operatorio_id",            null: false
    t.integer "persona_id",                      null: false
    t.string  "Rol_Funcion",          limit: 64
    t.index ["persona_id"], name: "FK_REFERENCE_29", using: :btree
  end

  create_table "estado_pacientes", primary_key: "estado_paciente_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "consulta_id"
    t.time    "Stp_Hora_Inicio"
    t.string  "Stp_Via_Aerea",             limit: 16
    t.string  "Stp_Condicion_Llegada",     limit: 16
    t.string  "Stp_Forma_Llegada",         limit: 16
    t.time    "Stp_Hora_Salida"
    t.text    "Stp_Observacion_Salida",    limit: 4294967295
    t.string  "Stp_Condicion_Salida",      limit: 32
    t.string  "Stp_Nombre_Acompaniante",   limit: 64
    t.string  "Stp_Cedula_Acompaniante",   limit: 10
    t.string  "Stp_Parentesco_Afinidad",   limit: 32
    t.string  "Stp_Telefono_Acompaniante", limit: 10
    t.text    "Stp_Motivo_Llegada",        limit: 4294967295
    t.string  "Stp_Persona_Notificacion",  limit: 64
    t.string  "Stp_Direccion_AC",          limit: 128
    t.string  "Stp_Direccion_PN",          limit: 128
    t.string  "Stp_Telefono_PN",           limit: 10
    t.string  "Stp_Institucion",           limit: 64
    t.string  "Stp_Telefono_Institucion",  limit: 10
    t.string  "Stp_Fuente_Informacion",    limit: 64
    t.string  "Stp_Muerto_Emergencia",     limit: 2
    t.string  "Stp_Causa_Muerte",          limit: 1024
    t.index ["consulta_id"], name: "FK_REFERENCE_11", using: :btree
  end

  create_table "examen_fisicos", primary_key: "examen_fisico_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "consulta_id"
    t.text    "Efb_Observacion",          limit: 4294967295
    t.string  "Efb_Parte_CH",             limit: 32
    t.string  "Efb_Evidencia_Patologica", limit: 2
    t.index ["consulta_id"], name: "FK_REFERENCE_8", using: :btree
  end

  create_table "examenes", primary_key: "examen_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "prescripcion_id"
    t.text    "Exa_Descripcion", limit: 4294967295
    t.string  "Exa_Tipo",        limit: 32
    t.string  "Exa_Motivo",      limit: 512
    t.string  "Exa_Prioridad",   limit: 16
    t.date    "Exa_Fecha_Orden"
    t.text    "Exa_Resultado",   limit: 4294967295
    t.index ["prescripcion_id"], name: "FK_REFERENCE_25", using: :btree
  end

  create_table "hallazgos_revelantes", primary_key: "hallazgos_relevante", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "epicrisi_id"
    t.string  "Hre_Estudio_Tipo", limit: 16
    t.string  "Hre_Descripcion",  limit: 512
    t.index ["epicrisi_id"], name: "FK_REFERENCE_34", using: :btree
  end

  create_table "horarios", primary_key: "horario_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "medico_id"
    t.time    "Hor_Hora_Inicio"
    t.time    "Hor_Hora_Fin"
    t.string  "Hor_Dia",         limit: 16
    t.index ["medico_id"], name: "FK_REFERENCE_16", using: :btree
  end

  create_table "ingresos", primary_key: "ingreso_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "partes_operatorio_id"
    t.date     "Ing_Fecha"
    t.time     "Ing_Hora"
    t.integer  "Ing_Habitacion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
    t.string   "Ing_Estado",           limit: 32
    t.index ["partes_operatorio_id"], name: "FK_REFERENCE_41", using: :btree
  end

  create_table "medicinas", primary_key: "medicina_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "prescripcion_id"
    t.string  "Ins_Nombre",      limit: 256
    t.string  "Ins_Indicacion",  limit: 512
    t.integer "Ins_Cantidad"
    t.index ["prescripcion_id"], name: "FK_REFERENCE_23", using: :btree
  end

  create_table "medicos", primary_key: "medico_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "persona_id"
    t.string  "Med_Especialidad", limit: 64, null: false
    t.index ["persona_id"], name: "FK_REFERENCE_12", using: :btree
  end

  create_table "menus", primary_key: "menu_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "Menu_Nombre", limit: 64
    t.string "Menu_Icono"
    t.string "Menu_Path"
  end

  create_table "notas", primary_key: "nota_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "ingreso_id"
    t.date     "Not_Fecha"
    t.time     "Not_Hora"
    t.string   "Not_Tipo",   limit: 32
    t.text     "Not_Nota",   limit: 4294967295
    t.datetime "created_at"
    t.integer  "usuario_id"
    t.index ["ingreso_id"], name: "FK_REFERENCE_35", using: :btree
  end

  create_table "pacientes", primary_key: "paciente_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "Pac_HC",                 limit: 8
    t.string   "Pac_Cedula",             limit: 10
    t.string   "Pac_Pasaporte",          limit: 16
    t.string   "Pac_Apellido_Paterno",   limit: 32
    t.string   "Pac_Apellido_Materno",   limit: 32
    t.string   "Pac_Nombres",            limit: 128
    t.date     "Pac_Fecha_Nacimiento"
    t.string   "Pac_Nacionalidad",       limit: 64
    t.string   "Pac_Genero",             limit: 1
    t.string   "Pac_Estado_Civil",       limit: 16
    t.string   "Pac_Instruccion",        limit: 16
    t.string   "Pac_Ocupacion",          limit: 128
    t.string   "Pac_Telefono",           limit: 10
    t.string   "Pac_Grupo_Sanguineo",    limit: 16
    t.string   "Pac_Correo_Electronico", limit: 64
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
  end

  create_table "partes_operatorios", primary_key: "partes_operatorio_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "prescripcion_id"
    t.date     "Pop_Fecha_Parte"
    t.date     "Pop_Fecha_Cirugia"
    t.time     "Pop_Hora_Cirugia"
    t.text     "Pop_Cirugia_Propuesta",         limit: 4294967295
    t.text     "Pop_Diagnostico_PreOperatorio", limit: 4294967295
    t.time     "Pop_Tiempo_Cirugia"
    t.string   "Pop_Instrumental_Especial",     limit: 512
    t.string   "Pop_Servicio",                  limit: 128
    t.string   "Pop_Cirugia_Tipo",              limit: 16
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
    t.index ["prescripcion_id"], name: "FK_REFERENCE_27", using: :btree
  end

  create_table "percances", primary_key: "percance_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "consulta_id"
    t.string  "Pca_Lugar_Evento",                       limit: 256
    t.string  "Pca_Direccion_Evento",                   limit: 256
    t.date    "Pca_Fecha"
    t.time    "Pca_Hora"
    t.string  "Pca_Tipo_Objeto",                        limit: 64
    t.string  "Pca_Tipo_Evento",                        limit: 64
    t.text    "Pca_Observacion_Evento",                 limit: 4294967295
    t.string  "Pca_Autoridad",                          limit: 64
    t.time    "Pca_Hora_Denuncia"
    t.string  "Pca_Custodia_Policial",                  limit: 2
    t.string  "Pca_Aliento_Etilico",                    limit: 2
    t.decimal "Pca_Valor_Alcocheck",                                       precision: 4, scale: 2
    t.time    "Pca_Hora_Examen"
    t.string  "Pca_Alcoholemia",                        limit: 2
    t.string  "Pca_Otras",                              limit: 512
    t.string  "Pca_Violencia_Sospecha",                 limit: 2
    t.integer "Pca_Grado_Quemadura"
    t.decimal "Pca_Quemadura_Porcentaje",                                  precision: 4, scale: 2
    t.string  "Pca_Picadura",                           limit: 256
    t.string  "Pca_Mordedura",                          limit: 256
    t.text    "Pca_Observacion_Intoxicacion_Violencia", limit: 4294967295
    t.string  "Pca_Violencia_AbusoFisico",              limit: 2
    t.string  "Pca_Violencia_AbusoPsicologico",         limit: 2
    t.string  "Pca_Violencia_AbusoSexual",              limit: 2
    t.index ["consulta_id"], name: "FK_REFERENCE_9", using: :btree
  end

  create_table "perfil_menus", primary_key: "perfil_Menu_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "perfil_id"
    t.integer "menu_id"
    t.index ["menu_id"], name: "FK_REFERENCE_22", using: :btree
    t.index ["perfil_id"], name: "FK_REFERENCE_21", using: :btree
  end

  create_table "perfiles", primary_key: "perfil_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "Nombre_perfil", limit: 32
    t.string   "Estado",        limit: 8
    t.datetime "created_at",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "personas", primary_key: "persona_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "usuario_id"
    t.string  "Per_Cedula",           limit: 10
    t.string  "Per_Apellido_Paterno", limit: 32
    t.string  "Per_Apellido_Materno", limit: 32
    t.string  "Per_Nombres",          limit: 64
    t.date    "Per_Fecha_Nacimiento"
    t.string  "Per_Telefono",         limit: 10
    t.index ["usuario_id"], name: "FK_REFERENCE_19", using: :btree
  end

  create_table "prescripciones", primary_key: "prescripcion_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "consulta_id"
    t.text    "Pre_Procedimiento",          limit: 4294967295
    t.text    "Pre_Indicaciones_Generales", limit: 4294967295
    t.text    "Pre_Observacion",            limit: 4294967295
    t.index ["consulta_id"], name: "FK_REFERENCE_26", using: :btree
  end

  create_table "protocolo_operaciones", primary_key: "protocolo_operacion_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "ingreso_id"
    t.time     "Pdo_Hora_Inicio",                                   null: false
    t.time     "Pdo_Hora_Fin",                                      null: false
    t.string   "Pdo_Tipo_Anestecia",             limit: 32,         null: false
    t.date     "Pdo_Fecha"
    t.string   "Pdo_Diagnostico_PostOperatorio", limit: 256
    t.string   "Pdo_Tipo_Operacion",             limit: 4
    t.string   "Pdo_Proyectada",                 limit: 256
    t.string   "Pdo_Realizada",                  limit: 256
    t.string   "Pdo_Dieresis",                   limit: 512
    t.string   "Pdo_Diagnostico_Hispatologico",  limit: 512
    t.string   "Pdo_Dictada",                    limit: 32
    t.text     "Pdo_Procedimiento",              limit: 4294967295
    t.text     "Pdo_Exposicion",                 limit: 4294967295
    t.datetime "created_at"
    t.integer  "usuario_id"
    t.text     "Pdo_Hallazgos",                  limit: 4294967295
    t.text     "Pdo_Complicaciones",             limit: 4294967295
    t.index ["ingreso_id"], name: "FK_REFERENCE_38", using: :btree
  end

  create_table "provincias", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "nombre",     limit: 65535
    t.text "created_at", limit: 65535
    t.text "updated_at", limit: 65535
  end

  create_table "residencias", primary_key: "residencia_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "paciente_id"
    t.string  "Res_Sector",           limit: 128
    t.string  "Res_Calle_Principal",  limit: 64
    t.string  "Res_Calle_Secundaria", limit: 64
    t.string  "Res_Numero_Casa",      limit: 8
    t.string  "Res_Provincia",        limit: 16
    t.string  "Res_Canton",           limit: 16
    t.index ["paciente_id"], name: "FK_REFERENCE_17", using: :btree
  end

  create_table "revisiones", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "medico_id"
    t.bigint  "nota_id"
    t.string  "Observacion", limit: 512
    t.index ["medico_id"], name: "FK_REFERENCE_37", using: :btree
    t.index ["nota_id"], name: "FK_REFERENCE_36", using: :btree
  end

  create_table "signos_vitales", primary_key: "signos_vitale_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "ingreso_id"
    t.date     "Siv_Fecha",                                                          null: false
    t.time     "Siv_Hora",                                                           null: false
    t.integer  "Siv_Dia_Internacion"
    t.integer  "Siv_Dia_PostQuirurgico"
    t.integer  "Siv_Pulso"
    t.decimal  "Siv_Temperatura",                            precision: 4, scale: 2
    t.integer  "Siv_Frecuencia_Respiratoria"
    t.integer  "Siv_Presion_Arterial_Diastolica"
    t.integer  "Siv_Presion_Arterial_Sistolica"
    t.integer  "Siv_Saturacion"
    t.integer  "Siv_Ingresos_Parenteral"
    t.integer  "Siv_Ingresos_ViaOral"
    t.integer  "Siv_Ingresos_Total"
    t.integer  "Siv_Eliminaciones_Orina"
    t.integer  "Siv_Eliminaciones_Drenaje"
    t.integer  "Siv_Eliminaciones_Otros"
    t.integer  "Siv_Eliminaciones_Total"
    t.string   "Siv_Aseo",                        limit: 2
    t.decimal  "Siv_Peso",                                   precision: 5, scale: 2
    t.string   "Siv_Dieta_Administrada",          limit: 64
    t.integer  "Siv_Numero_Comidas"
    t.integer  "Siv_Numero_Micciones"
    t.integer  "Siv_Numero_Deposiciones"
    t.string   "Siv_Actividad_Fisica",            limit: 2
    t.string   "Siv_Cambio_Sonda",                limit: 2
    t.string   "Siv_Recanalizacion_Via",          limit: 2
    t.datetime "created_at",                                                         null: false
    t.integer  "usuario_id"
    t.index ["ingreso_id"], name: "FK_REFERENCE_30", using: :btree
  end

  create_table "signos_vitales_basicos", primary_key: "signos_vitales_basico_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "consulta_id"
    t.string  "Sgc_Presion_Arterial",        limit: 8
    t.string  "Sgc_Frecuencia_Cardiaca",     limit: 8
    t.string  "Sgc_Frecuencia_Respiratoria", limit: 8
    t.decimal "Sgc_Temperatura_Bucal",                 precision: 4, scale: 2
    t.decimal "Sgc_Temperatura_Axilar",                precision: 4, scale: 2
    t.decimal "Sgc_Peso",                              precision: 6, scale: 2
    t.decimal "Sgc_Talla",                             precision: 6, scale: 2
    t.index ["consulta_id"], name: "FK_REFERENCE_10", using: :btree
  end

  create_table "sintomas", primary_key: "sintoma_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "Sin_Descripcion",      limit: 512
    t.string "Sin_Region_Anatomica", limit: 64
    t.string "Sin_Punto_Doloroso",   limit: 64
    t.string "Sin_Evolucion",        limit: 16
    t.string "Sin_Tipo",             limit: 16
    t.string "Sin_Modificaciones",   limit: 16
    t.string "Sin_Alivia",           limit: 16
    t.string "Sin_Intensidad",       limit: 16
  end

  create_table "terapias", primary_key: "terapia_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "prescripcion_id"
    t.integer "Ter_Numero_Sesiones"
    t.text    "Ter_indicacion",      limit: 4294967295
    t.index ["prescripcion_id"], name: "FK_REFERENCE_24", using: :btree
  end

  create_table "usuarios", primary_key: "usuario_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "perfil_id"
    t.string   "User_Name",  limit: 32
    t.string   "Password"
    t.string   "Estado",     limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["perfil_id"], name: "FK_REFERENCE_20", using: :btree
  end

  add_foreign_key "antecedentes", "pacientes", primary_key: "paciente_id", name: "FK_REFERENCE_18"
  add_foreign_key "chequeos_cardiologicos", "ingresos", primary_key: "ingreso_id", name: "FK_REFERENCE_31"
  add_foreign_key "citas", "empleados", primary_key: "empleado_id", name: "FK_REFERENCE_14"
  add_foreign_key "citas", "medicos", primary_key: "medico_id", name: "FK_REFERENCE_15"
  add_foreign_key "citas", "pacientes", primary_key: "paciente_id", name: "FK_REFERENCE_4"
  add_foreign_key "complicaciones", "protocolo_operaciones", column: "protocolo_operacion_id", primary_key: "protocolo_operacion_id", name: "FK_REFERENCE_40"
  add_foreign_key "condiciones_egresos", "epicrisis", column: "epicrisi_id", primary_key: "epicrisi_id", name: "FK_REFERENCE_33"
  add_foreign_key "consultas", "citas", primary_key: "cita_id", name: "FK_REFERENCE_3"
  add_foreign_key "diagnosticos", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_6"
  add_foreign_key "diagnosticos", "sintomas", primary_key: "sintoma_id", name: "FK_REFERENCE_5"
  add_foreign_key "empleados", "personas", primary_key: "persona_id", name: "FK_REFERENCE_13"
  add_foreign_key "enfermeria_notas", "empleados", primary_key: "empleado_id", name: "FK_REFERENCE_42"
  add_foreign_key "enfermeria_notas", "ingresos", primary_key: "ingreso_id", name: "FK_REFERENCE_43"
  add_foreign_key "epicrisis", "ingresos", primary_key: "ingreso_id", name: "FK_REFERENCE_32"
  add_foreign_key "equipos", "partes_operatorios", primary_key: "partes_operatorio_id", name: "FK_REFERENCE_28"
  add_foreign_key "equipos", "personas", primary_key: "persona_id", name: "FK_REFERENCE_29"
  add_foreign_key "estado_pacientes", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_11"
  add_foreign_key "examen_fisicos", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_8"
  add_foreign_key "examenes", "prescripciones", primary_key: "prescripcion_id", name: "FK_REFERENCE_25"
  add_foreign_key "hallazgos_revelantes", "epicrisis", column: "epicrisi_id", primary_key: "epicrisi_id", name: "FK_REFERENCE_34"
  add_foreign_key "horarios", "medicos", primary_key: "medico_id", name: "FK_REFERENCE_16"
  add_foreign_key "ingresos", "partes_operatorios", primary_key: "partes_operatorio_id", name: "FK_REFERENCE_41"
  add_foreign_key "medicinas", "prescripciones", primary_key: "prescripcion_id", name: "FK_REFERENCE_23"
  add_foreign_key "medicos", "personas", primary_key: "persona_id", name: "FK_REFERENCE_12"
  add_foreign_key "notas", "ingresos", primary_key: "ingreso_id", name: "FK_REFERENCE_35"
  add_foreign_key "partes_operatorios", "prescripciones", primary_key: "prescripcion_id", name: "FK_REFERENCE_27"
  add_foreign_key "percances", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_9"
  add_foreign_key "perfil_menus", "menus", primary_key: "menu_id", name: "FK_REFERENCE_22"
  add_foreign_key "perfil_menus", "perfiles", primary_key: "perfil_id", name: "FK_REFERENCE_21"
  add_foreign_key "personas", "usuarios", primary_key: "usuario_id", name: "FK_REFERENCE_19"
  add_foreign_key "prescripciones", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_26"
  add_foreign_key "protocolo_operaciones", "ingresos", primary_key: "ingreso_id", name: "FK_REFERENCE_38"
  add_foreign_key "residencias", "pacientes", primary_key: "paciente_id", name: "FK_REFERENCE_17"
  add_foreign_key "revisiones", "medicos", primary_key: "medico_id", name: "FK_REFERENCE_37"
  add_foreign_key "revisiones", "notas", primary_key: "nota_id", name: "FK_REFERENCE_36"
  add_foreign_key "signos_vitales", "ingresos", primary_key: "ingreso_id", name: "FK_REFERENCE_30"
  add_foreign_key "signos_vitales_basicos", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_10"
  add_foreign_key "terapias", "prescripciones", primary_key: "prescripcion_id", name: "FK_REFERENCE_24"
  add_foreign_key "usuarios", "perfiles", primary_key: "perfil_id", name: "FK_REFERENCE_20"
end
