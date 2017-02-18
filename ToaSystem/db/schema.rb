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

  create_table "administracion_medicamento", primary_key: "ADM_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "PER_ID",                             null: false
    t.integer  "ING_ID",                             null: false
    t.date     "ADM_FECHA"
    t.time     "ADM_HORA"
    t.string   "ADM_TIPO_ADMINISTRACION", limit: 2
    t.string   "ADM_CANTIDAD",            limit: 16
    t.string   "ADM_ESTADO",              limit: 3
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["ING_ID"], name: "FK_INHERITANCE_8", using: :btree
    t.index ["PER_ID"], name: "FK_INHERITANCE_9", using: :btree
  end

  create_table "antecedents", primary_key: "ANT_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "PAC_ID",                      null: false
    t.string "ANT_TIPO",        limit: 32,  null: false
    t.string "ANT_DESCRIPCION", limit: 256, null: false
    t.index ["PAC_ID"], name: "FK_TIENE_ANT", using: :btree
  end

  create_table "appointments", primary_key: "CIT_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "MED_PER_ID",                    null: false
    t.bigint   "PAC_ID",                        null: false
    t.integer  "PER_ID",                        null: false
    t.date     "CIT_FECHA",                     null: false
    t.time     "CIT_HORA",                      null: false
    t.string   "CIT_ESTADO",          limit: 3, null: false
    t.string   "CIT_TIPO",            limit: 3, null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["MED_PER_ID"], name: "FK_INHERITANCE_2", using: :btree
    t.index ["PAC_ID"], name: "FK_RELATIONSHIP_3", using: :btree
    t.index ["PER_ID"], name: "FK_REGRISTRA", using: :btree
  end

  create_table "attentions", primary_key: ["PER_ID", "CON_ID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "PER_ID",                  null: false
    t.bigint  "CON_ID",                  null: false
    t.string  "OBSERVACION", limit: 512
    t.index ["CON_ID"], name: "FK_ATENCION2", using: :btree
  end

  create_table "basic_vital_signs", primary_key: "SGC_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "CON_ID",                                                        null: false
    t.string   "SGC_PRESION_ARTERIAL",        limit: 8
    t.string   "SGC_FRECUENCIA_CARDIACA",     limit: 8
    t.string   "SGC_FRECUENCIA_RESPIRATORIA", limit: 8
    t.decimal  "SGC_TEMPERATURA_BUCAL",                 precision: 4, scale: 2
    t.decimal  "SGC_TEMPERATURA_AXILAR",                precision: 4, scale: 2
    t.decimal  "SGC_PESO",                              precision: 6, scale: 2
    t.decimal  "SGC_TALLA",                             precision: 6, scale: 2
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["CON_ID"], name: "FK_RELATIONSHIP_17", using: :btree
  end

  create_table "cantons", primary_key: "CAN_NOMBRE", id: :string, limit: 64, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "PRO_NOMBRE", limit: 64, null: false
    t.index ["PRO_NOMBRE"], name: "FK_RELATIONSHIP_16", using: :btree
  end

  create_table "cardiological_checkups", primary_key: "CHC_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "ING_ID",                                                    null: false
    t.string   "CHC_RITMO",             limit: 32,                          null: false
    t.decimal  "CHC_FRECUENCIA",                    precision: 4, scale: 2, null: false
    t.string   "CHC_SAQRS",             limit: 32,                          null: false
    t.string   "CHC_ONDA_P",            limit: 32,                          null: false
    t.float    "CHC_SEGMENTO_PR",       limit: 24,                          null: false
    t.float    "CHC_COMPLEJO_QRS",      limit: 24,                          null: false
    t.string   "CHC_INDICE_SOCOLOV",    limit: 32,                          null: false
    t.string   "CHC_ONDA_T",            limit: 32,                          null: false
    t.string   "CHC_SEGMENTO_ST",       limit: 32,                          null: false
    t.string   "CHC_CONCLUSIONES",      limit: 256,                         null: false
    t.string   "CHC_SUGERENCIAS",       limit: 256,                         null: false
    t.string   "CHC_RIESGO_QUIRURGICO", limit: 32,                          null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["ING_ID"], name: "FK_RELATIONSHIP_23", using: :btree
  end

  create_table "codes", primary_key: "CIE_CODIGO", id: :string, limit: 16, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "CIE_NOMBRE",          limit: 512, null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
  end

  create_table "complications", primary_key: "COM_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "PDO_ID",                                   null: false
    t.string "COM_DESCRIPCION_COMPLICACION", limit: 512, null: false
    t.index ["PDO_ID"], name: "FK_RELATIONSHIP_28", using: :btree
  end

  create_table "consultations", primary_key: "CON_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "CTR_CON_ID"
    t.bigint   "CIT_ID",                          null: false
    t.string   "CON_CRONOLOGIA",      limit: 256, null: false
    t.string   "CON_OBSERVACION",     limit: 256
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["CIT_ID"], name: "FK_RELATIONSHIP_2", using: :btree
    t.index ["CTR_CON_ID"], name: "FK_RELATIONSHIP_36", using: :btree
  end

  create_table "diagnostics", primary_key: ["CON_ID", "SIN_ID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "CON_ID",                       null: false
    t.bigint "SIN_ID",                       null: false
    t.string "CIE_CODIGO",       limit: 16
    t.string "TIPO_DIAGNOSTICO", limit: 16,  null: false
    t.string "DIAGNOSTICO",      limit: 512
    t.index ["CIE_CODIGO"], name: "FK_REFERENCE_49", using: :btree
    t.index ["SIN_ID"], name: "FK_DIAGNOSTICO2", using: :btree
  end

  create_table "doctors", primary_key: "PER_ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "MED_ESPECIALIDAD", limit: 32, null: false
  end

  create_table "employees", primary_key: "PER_ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "EMP_ROL", limit: 32, null: false
  end

  create_table "epicrisis", primary_key: "EPI_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "ING_ID",                                     null: false
    t.string   "EPI_RESUMEN_CUADRO_CLINICO",     limit: 512
    t.string   "EPI_TIPO_EGRESO",                limit: 2
    t.string   "EPI_RESUMEN_EVO_COMPLICACIONES", limit: 512
    t.string   "EPI_RESUMEN_TRATAMIENTO",        limit: 512
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["ING_ID"], name: "FK_FINALIZA_CON", using: :btree
  end

  create_table "exams", primary_key: "TER_ID2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "PRE_ID"
    t.string "EXA_NOMBRE", limit: 32, null: false
    t.string "EXA_TIPO",   limit: 32, null: false
    t.index ["PRE_ID"], name: "FK_REFERENCE_50", using: :btree
  end

  create_table "exhibitions", primary_key: "EXP_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "PDO_ID",                      null: false
    t.string "EXP_DESCRIPCION", limit: 512
    t.index ["PDO_ID"], name: "FK_RELATIONSHIP_27", using: :btree
  end

  create_table "exit_conditions", primary_key: "CEG_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "EPI_ID",                      null: false
    t.string  "CEG_DESCRIPCION", limit: 512
    t.index ["EPI_ID"], name: "FK_TIENE_", using: :btree
  end

  create_table "findings", primary_key: "HAL_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "PDO_ID",                      null: false
    t.string "HAL_DESCRIPCION", limit: 256
    t.index ["PDO_ID"], name: "FK_RELATIONSHIP_25", using: :btree
  end

  create_table "formado_por", primary_key: ["POP_ID", "PER_ID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "POP_ID",                 null: false
    t.integer "PER_ID",                 null: false
    t.string  "ROL_FUNCION", limit: 64, null: false
    t.index ["PER_ID"], name: "FK_FORMADO_POR2", using: :btree
  end

  create_table "income", primary_key: "ING_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "POP_ID",                   null: false
    t.date   "ING_FECHA",                null: false
    t.time   "ING_HORA",                 null: false
    t.string "ING_HABITACION", limit: 5, null: false
    t.index ["POP_ID"], name: "FK_RELATIONSHIP_12", using: :btree
  end

  create_table "medicines", primary_key: "MEC_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "PRE_ID"
    t.string "EXA_NOMBRE", limit: 32, null: false
    t.index ["PRE_ID"], name: "FK_REFERENCE_47", using: :btree
  end

  create_table "mishaps", primary_key: "PCA_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "CON_ID",                                                       null: false
    t.string   "PCA_LUGAR_EVENTO",         limit: 256,                         null: false
    t.string   "PCA_DIRECCCION_EVENTO",    limit: 256,                         null: false
    t.date     "PCA_FECHA",                                                    null: false
    t.time     "PCA_HORA",                                                     null: false
    t.string   "PCA_TIPO_OBJETO",          limit: 64
    t.string   "PCA_TIPO_EVENTO",          limit: 64,                          null: false
    t.string   "PCA_OBSERVACION",          limit: 512
    t.string   "PCA_AUTORIDAD",            limit: 64
    t.time     "PCA_HORA_DENUNCIA"
    t.string   "PCA_CUSTODIA_POLICIAL",    limit: 1
    t.string   "PCA_ALIENTO_ETILICO",      limit: 1
    t.decimal  "PCA_VALOR_ALCOCHECK",                  precision: 4, scale: 2
    t.time     "PCA_HORA_EXAMEN"
    t.string   "PCA_ALCOHOLEMIA",          limit: 1
    t.string   "PCA_OTRAS",                limit: 512
    t.string   "PCA_VIOLENCIA_TIPO",       limit: 64
    t.integer  "PCA_GRADO_QUEMADURA"
    t.decimal  "PCA_QUEMADURA_PORCENTAJE",             precision: 4, scale: 2
    t.string   "PCA_PICADURA",             limit: 256
    t.string   "PCA_MORDEDURA",            limit: 256
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["CON_ID"], name: "FK_RELATIONSHIP_37", using: :btree
  end

  create_table "notes", primary_key: "NOT_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "ING_ID"
    t.string   "NOT_SUBJETIVO",       limit: 256, null: false
    t.string   "NOT_OBJETIVO",        limit: 256, null: false
    t.string   "NOT_ANALISIS",        limit: 256, null: false
    t.string   "NOT_PLANES",          limit: 512, null: false
    t.date     "NOT_FECHA",                       null: false
    t.time     "NOT_HORA",                        null: false
    t.string   "NOT_TIPO",            limit: 1,   null: false
    t.string   "NOT_COMENTARIO",      limit: 256, null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["ING_ID"], name: "FK_GENERA_", using: :btree
  end

  create_table "nursing_activities", primary_key: "ACE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "PER_ID",                           null: false
    t.integer  "ING_ID",                           null: false
    t.date     "ACE_FECHA"
    t.string   "ACE_NOMBRE_ACTIVIDAD", limit: 128
    t.string   "ACE_ESTADO",           limit: 32
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["ING_ID"], name: "FK_INHERITANCE_7", using: :btree
    t.index ["PER_ID"], name: "FK_INHERITANCE_10", using: :btree
  end

  create_table "nursing_notes", primary_key: "NDE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "PER_ID",                           null: false
    t.integer  "ING_ID",                           null: false
    t.date     "NDE_FECHA",                        null: false
    t.time     "NDE_HORA",                         null: false
    t.string   "NDE_OBSERVACION",     limit: 1024, null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["ING_ID"], name: "FK_INHERITANCE_6", using: :btree
    t.index ["PER_ID"], name: "FK_INHERITANCE_5", using: :btree
  end

  create_table "operation_protocols", primary_key: "PDO_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "ING_ID",                                      null: false
    t.time     "PDO_HORA_INICIO",                             null: false
    t.time     "PDO_HORA_FIN",                                null: false
    t.string   "PDO_TIPO_ANESTECIA",              limit: 32,  null: false
    t.date     "PDO_FECHA"
    t.string   "PDO_DIAGNOSTICO_POST_OPERATORIO", limit: 256
    t.string   "PDO_TIPO_OPERACION",              limit: 4
    t.string   "PDO_PROYECTADA",                  limit: 256
    t.string   "PDO_REALIZADA",                   limit: 256
    t.string   "PDO_DIERESIS",                    limit: 512
    t.string   "PDO_DIAGNOSTICO_HISPATOLOGICO",   limit: 512
    t.string   "PDO_DICTADA",                     limit: 32
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["ING_ID"], name: "FK_REQUIERE", using: :btree
  end

  create_table "operative_parts", primary_key: "POP_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "PRE_ID"
    t.date     "POP_FECHA_POPERATORIO",             null: false
    t.date     "POP_FECHA_CIRUGIA",                 null: false
    t.time     "POP_HORA_CIRUGIA",                  null: false
    t.string   "POP_CIRUGIA_PROPUESTA", limit: 512, null: false
    t.string   "POP_TIEMPO",            limit: 16
    t.string   "POP_INSTRUMENTAL",      limit: 128, null: false
    t.string   "POP_SERVICIO",          limit: 32
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["PRE_ID"], name: "FK_REFERENCE_46", using: :btree
  end

  create_table "operative_procedures", primary_key: "PRO_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "PDO_ID",                           null: false
    t.integer "PRO_PASO_NUMERO"
    t.string  "PRO_PASO_DESCRIPCION", limit: 256
    t.index ["PDO_ID"], name: "FK_RELATIONSHIP_26", using: :btree
  end

  create_table "patient_states", primary_key: "STP_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "CON_ID",                                       null: false
    t.time     "STP_HORA_INICIO",                              null: false
    t.string   "STP_VIA_AEREA",             limit: 2
    t.string   "STP_CONDICION_LLEGADA",     limit: 16,         null: false
    t.string   "STP_FORMA_LLEGADA",         limit: 4,          null: false
    t.time     "STP_HORA_SALIDA"
    t.text     "STP_OBSERVACION_SALIDA",    limit: 4294967295
    t.string   "STP_CONDICION_SALIDA",      limit: 32
    t.string   "STD_NOMBRE_ACOMPANANTE",    limit: 64,         null: false
    t.string   "STP_CEDULA_ACOMPANANTE",    limit: 10
    t.string   "STP_PARENTESCO_ACOMPANATE", limit: 16
    t.string   "STD_TELEFONO_ACOMPANANTE",  limit: 10
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["CON_ID"], name: "FK_RELATIONSHIP_19", using: :btree
  end

  create_table "patients", primary_key: "PAC_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "PAC_HC",               limit: 8,   null: false
    t.string   "PAC_CEDULA",           limit: 10,  null: false
    t.string   "PAC_APELLIDO_PATERNO", limit: 32,  null: false
    t.string   "PAC_APELLIDO_MATERNO", limit: 32,  null: false
    t.string   "PAC_NOMBRES",          limit: 128, null: false
    t.date     "PAC_FECHA_NACIMIENTO",             null: false
    t.string   "PAC_NACIONALIDAD",     limit: 64,  null: false
    t.string   "PAC_GENERO",           limit: 1,   null: false
    t.string   "PAC_ESTADO_CIVIL",     limit: 3,   null: false
    t.string   "PAC_INSTRUCCION",      limit: 4
    t.string   "PAC_OCUPACION",        limit: 128
    t.string   "PAC_TELEFONO",         limit: 10
    t.string   "PAC_GRUPO_SANGUINEO",  limit: 16
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
  end

  create_table "physical_exams", primary_key: "EFB_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "CON_ID",                                     null: false
    t.text     "EFB_OBSERVACION",         limit: 4294967295
    t.string   "EFB_TIPO",                limit: 1,          null: false
    t.string   "EFB_EVIDENCIA_PATOLOGIA", limit: 2,          null: false
    t.string   "EFB_CATEGORIA",           limit: 1,          null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["CON_ID"], name: "FK_RELATIONSHIP_18", using: :btree
  end

  create_table "prescriptions", primary_key: "PRE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "CON_ID",                     null: false
    t.string "PRE_INDICACION", limit: 256, null: false
    t.index ["CON_ID"], name: "FK_GENERA", using: :btree
  end

  create_table "provinces", primary_key: "PRO_NOMBRE", id: :string, limit: 64, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
  end

  create_table "relevant_findings", primary_key: "HRE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "EPI_ID",                       null: false
    t.string  "HRE_ESTUDIO_TIPO", limit: 16
    t.string  "HRE_DESCRIPCION",  limit: 512
    t.index ["EPI_ID"], name: "FK_TIENE", using: :btree
  end

  create_table "residences", primary_key: "RES_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "CAN_NOMBRE",           limit: 64
    t.bigint "PAC_ID",                           null: false
    t.string "RES_SECTOR",           limit: 128, null: false
    t.string "RES_CALLE_PRINCIPAL",  limit: 64
    t.string "RES_CALLE_SECUNDARIA", limit: 64
    t.string "RES_NUMERO_CASA",      limit: 8
    t.index ["CAN_NOMBRE"], name: "FK_RELATIONSHIP_15", using: :btree
    t.index ["PAC_ID"], name: "FK_HABITA", using: :btree
  end

  create_table "reviews", primary_key: ["PER_ID", "REV_ID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "PER_ID",                  null: false
    t.bigint  "REV_ID",                  null: false
    t.integer "NOT_ID",                  null: false
    t.string  "OBSERVACION", limit: 512
    t.index ["NOT_ID"], name: "FK_RELATIONSHIP_35", using: :btree
  end

  create_table "schedules", primary_key: "HOR_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "PER_ID",                         null: false
    t.time     "HOR_HORA_INICIO",                null: false
    t.time     "HOR_HORA_FIN",                   null: false
    t.string   "HOR_DIA",             limit: 16, null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["PER_ID"], name: "FK_RELATIONSHIP_33", using: :btree
  end

  create_table "staff", primary_key: "PER_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "PER_CEDULA",           limit: 10, null: false
    t.string   "PER_APELLIDOS",        limit: 64, null: false
    t.string   "PER_NOMBRES",          limit: 64, null: false
    t.date     "PER_FECHA_NACIMIENTO",            null: false
    t.string   "PER_TELEFONO",         limit: 10, null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
  end

  create_table "symptoms", primary_key: "SIN_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "SIN_DESCRIPCION",      limit: 512, null: false
    t.string "SIN_REGION_ANATOMICA", limit: 64,  null: false
    t.string "SIN_PUNTO_DOLOROSO",   limit: 64,  null: false
    t.string "SIN_EVOLUCION",        limit: 3
    t.string "SIN_TIPO",             limit: 4
    t.string "SIN_MODIFICACIONES",   limit: 4
    t.string "SIN_ALIVIA",           limit: 3
    t.string "SIN_INTENSIDAD",       limit: 4
  end

  create_table "therapies", primary_key: "TER_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "PRE_ID"
    t.string "EXA_NOMBRE", limit: 32, null: false
    t.string "EXA_TIPO",   limit: 32, null: false
    t.index ["PRE_ID"], name: "FK_REFERENCE_48", using: :btree
  end

  create_table "users", primary_key: "USU_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "PER_ID",                         null: false
    t.string   "USU_NOMBRE_USUARIO",  limit: 16, null: false
    t.string   "USU_CONTRASENA",      limit: 16, null: false
    t.string   "USU_ESTADO",          limit: 3,  null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["PER_ID"], name: "FK_RELATIONSHIP_34", using: :btree
  end

  create_table "vital_signs", primary_key: "SIV_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "ING_ID",                                                         null: false
    t.date     "SIV_FECHA",                                                      null: false
    t.time     "SIV_HORA",                                                       null: false
    t.date     "SIV_DIA_OPERACION",                                              null: false
    t.date     "SIV_DIA_POSTQUIRURGICO",                                         null: false
    t.decimal  "SIV_PULSO",                              precision: 4, scale: 2, null: false
    t.decimal  "SIV_TEMPERATURA",                        precision: 4, scale: 2, null: false
    t.string   "SIV_FRECUENCIA_RESPIRATORIA", limit: 4,                          null: false
    t.string   "PRESION_ARTERIAL",            limit: 7,                          null: false
    t.decimal  "SIV_SATURACION_OXIGENO",                 precision: 4, scale: 2, null: false
    t.string   "SIV_ING_PARENTAL",            limit: 1
    t.string   "SIV_ING_VIA_ORAL",            limit: 1
    t.string   "SIV_ING_TOTAL",               limit: 1
    t.string   "SIV_ELI_ORINA",               limit: 1
    t.string   "SIV_ELI_DRENAJE",             limit: 1
    t.string   "SIV_ELI_OTROS",               limit: 1
    t.string   "SIV_ELI_TOTAL",               limit: 1
    t.string   "SIV_ASEO",                    limit: 1
    t.decimal  "SIV_PESO",                               precision: 5, scale: 2
    t.string   "SIV_DIETA",                   limit: 5
    t.integer  "SIV_NUMERO_COMIDAS"
    t.integer  "SIV_NUMERO_MICCIONES"
    t.integer  "SIV_NUMERO_DEPOSICIONES"
    t.string   "SIV_ACTIVIDAD_FISICA",        limit: 2
    t.string   "SIV_CAMBIO_SONDA",            limit: 1
    t.string   "SIV_RECANALIZACION_VIA",      limit: 1
    t.string   "SIV_RESPONSABLE",             limit: 32,                         null: false
    t.datetime "FECHA_CREACION"
    t.datetime "FECHA_ACTUALIZACION"
    t.integer  "ID_USUARIO_CREACION"
    t.index ["ING_ID"], name: "FK_REGISTRA", using: :btree
  end

  add_foreign_key "administracion_medicamento", "employees", column: "PER_ID", primary_key: "PER_ID", name: "FK_INHERITANCE_9"
  add_foreign_key "administracion_medicamento", "income", column: "ING_ID", primary_key: "ING_ID", name: "FK_INHERITANCE_8"
  add_foreign_key "antecedents", "patients", column: "PAC_ID", primary_key: "PAC_ID", name: "FK_TIENE_ANT"
  add_foreign_key "appointments", "doctors", column: "MED_PER_ID", primary_key: "PER_ID", name: "FK_INHERITANCE_2"
  add_foreign_key "appointments", "employees", column: "PER_ID", primary_key: "PER_ID", name: "FK_REGRISTRA"
  add_foreign_key "appointments", "patients", column: "PAC_ID", primary_key: "PAC_ID", name: "FK_RELATIONSHIP_3"
  add_foreign_key "attentions", "consultations", column: "CON_ID", primary_key: "CON_ID", name: "FK_ATENCION2"
  add_foreign_key "attentions", "doctors", column: "PER_ID", primary_key: "PER_ID", name: "FK_ATENCION"
  add_foreign_key "basic_vital_signs", "consultations", column: "CON_ID", primary_key: "CON_ID", name: "FK_RELATIONSHIP_17"
  add_foreign_key "cantons", "provinces", column: "PRO_NOMBRE", primary_key: "PRO_NOMBRE", name: "FK_RELATIONSHIP_16"
  add_foreign_key "cardiological_checkups", "income", column: "ING_ID", primary_key: "ING_ID", name: "FK_RELATIONSHIP_23"
  add_foreign_key "complications", "operation_protocols", column: "PDO_ID", primary_key: "PDO_ID", name: "FK_RELATIONSHIP_28"
  add_foreign_key "consultations", "appointments", column: "CIT_ID", primary_key: "CIT_ID", name: "FK_RELATIONSHIP_2"
  add_foreign_key "consultations", "consultations", column: "CTR_CON_ID", primary_key: "CON_ID", name: "FK_RELATIONSHIP_36"
  add_foreign_key "diagnostics", "codes", column: "CIE_CODIGO", primary_key: "CIE_CODIGO", name: "FK_REFERENCE_49"
  add_foreign_key "diagnostics", "consultations", column: "CON_ID", primary_key: "CON_ID", name: "FK_DIAGNOSTICO"
  add_foreign_key "diagnostics", "symptoms", column: "SIN_ID", primary_key: "SIN_ID", name: "FK_DIAGNOSTICO2"
  add_foreign_key "doctors", "staff", column: "PER_ID", primary_key: "PER_ID", name: "FK_HERENCIA_2"
  add_foreign_key "employees", "staff", column: "PER_ID", primary_key: "PER_ID", name: "FK_HERENCIA_3"
  add_foreign_key "epicrisis", "income", column: "ING_ID", primary_key: "ING_ID", name: "FK_FINALIZA_CON"
  add_foreign_key "exams", "prescriptions", column: "PRE_ID", primary_key: "PRE_ID", name: "FK_REFERENCE_50"
  add_foreign_key "exhibitions", "operation_protocols", column: "PDO_ID", primary_key: "PDO_ID", name: "FK_RELATIONSHIP_27"
  add_foreign_key "exit_conditions", "epicrisis", column: "EPI_ID", primary_key: "EPI_ID", name: "FK_TIENE_"
  add_foreign_key "findings", "operation_protocols", column: "PDO_ID", primary_key: "PDO_ID", name: "FK_RELATIONSHIP_25"
  add_foreign_key "formado_por", "doctors", column: "PER_ID", primary_key: "PER_ID", name: "FK_FORMADO_POR2"
  add_foreign_key "formado_por", "operative_parts", column: "POP_ID", primary_key: "POP_ID", name: "FK_FORMADO_POR"
  add_foreign_key "income", "operative_parts", column: "POP_ID", primary_key: "POP_ID", name: "FK_RELATIONSHIP_12"
  add_foreign_key "medicines", "prescriptions", column: "PRE_ID", primary_key: "PRE_ID", name: "FK_REFERENCE_47"
  add_foreign_key "mishaps", "consultations", column: "CON_ID", primary_key: "CON_ID", name: "FK_RELATIONSHIP_37"
  add_foreign_key "notes", "income", column: "ING_ID", primary_key: "ING_ID", name: "FK_GENERA_"
  add_foreign_key "nursing_activities", "employees", column: "PER_ID", primary_key: "PER_ID", name: "FK_INHERITANCE_10"
  add_foreign_key "nursing_activities", "income", column: "ING_ID", primary_key: "ING_ID", name: "FK_INHERITANCE_7"
  add_foreign_key "nursing_notes", "employees", column: "PER_ID", primary_key: "PER_ID", name: "FK_INHERITANCE_5"
  add_foreign_key "nursing_notes", "income", column: "ING_ID", primary_key: "ING_ID", name: "FK_INHERITANCE_6"
  add_foreign_key "operation_protocols", "income", column: "ING_ID", primary_key: "ING_ID", name: "FK_REQUIERE"
  add_foreign_key "operative_parts", "prescriptions", column: "PRE_ID", primary_key: "PRE_ID", name: "FK_REFERENCE_46"
  add_foreign_key "operative_procedures", "operation_protocols", column: "PDO_ID", primary_key: "PDO_ID", name: "FK_RELATIONSHIP_26"
  add_foreign_key "patient_states", "consultations", column: "CON_ID", primary_key: "CON_ID", name: "FK_RELATIONSHIP_19"
  add_foreign_key "physical_exams", "consultations", column: "CON_ID", primary_key: "CON_ID", name: "FK_RELATIONSHIP_18"
  add_foreign_key "prescriptions", "consultations", column: "CON_ID", primary_key: "CON_ID", name: "FK_GENERA"
  add_foreign_key "relevant_findings", "epicrisis", column: "EPI_ID", primary_key: "EPI_ID", name: "FK_TIENE"
  add_foreign_key "residences", "cantons", column: "CAN_NOMBRE", primary_key: "CAN_NOMBRE", name: "FK_RELATIONSHIP_15"
  add_foreign_key "residences", "patients", column: "PAC_ID", primary_key: "PAC_ID", name: "FK_HABITA"
  add_foreign_key "reviews", "doctors", column: "PER_ID", primary_key: "PER_ID", name: "FK_INHERITANCE_4"
  add_foreign_key "reviews", "notes", column: "NOT_ID", primary_key: "NOT_ID", name: "FK_RELATIONSHIP_35"
  add_foreign_key "schedules", "doctors", column: "PER_ID", primary_key: "PER_ID", name: "FK_RELATIONSHIP_33"
  add_foreign_key "therapies", "prescriptions", column: "PRE_ID", primary_key: "PRE_ID", name: "FK_REFERENCE_48"
  add_foreign_key "users", "staff", column: "PER_ID", primary_key: "PER_ID", name: "FK_RELATIONSHIP_34"
  add_foreign_key "vital_signs", "income", column: "ING_ID", primary_key: "ING_ID", name: "FK_REGISTRA"
end
