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
    t.integer  "user_id"
    t.index ["paciente_id"], name: "FK_REFERENCE_18", using: :btree
  end

  create_table "cantones", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id"
    t.text    "nombre",       limit: 65535
    t.integer "provincia_id"
    t.text    "created_at",   limit: 65535
    t.text    "updated_at",   limit: 65535
  end

  create_table "citas", primary_key: "cita_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "paciente_id"
    t.integer  "empleado_id"
    t.integer  "medico_id"
    t.date     "Cit_Fecha"
    t.time     "Cit_Hora"
    t.string   "Cit_Motivo",      limit: 128
    t.string   "Cit_Estado",      limit: 3
    t.string   "Cit_Observacion", limit: 128
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
    t.index ["empleado_id"], name: "FK_REFERENCE_14", using: :btree
    t.index ["medico_id"], name: "FK_REFERENCE_15", using: :btree
    t.index ["paciente_id"], name: "FK_REFERENCE_4", using: :btree
  end

  create_table "consultas", primary_key: "consulta_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "cita_id"
    t.string   "Con_Cronologia",  limit: 256
    t.string   "Con_Observacion", limit: 256
    t.datetime "creado_at"
    t.datetime "actualizado_at"
    t.integer  "user_id"
    t.index ["cita_id"], name: "FK_REFERENCE_3", using: :btree
  end

  create_table "diagnosticos", primary_key: "diagnostico_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "sintoma_id"
    t.integer "consulta_id"
    t.string  "Tipo_Diagnostico", limit: 16
    t.string  "Diagnostico",      limit: 512
    t.string  "Cie_Codigo",       limit: 16
    t.index ["consulta_id"], name: "FK_REFERENCE_6", using: :btree
    t.index ["sintoma_id"], name: "FK_REFERENCE_5", using: :btree
  end

  create_table "empleados", primary_key: "empleado_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "persona_id"
    t.string  "Emp_Rol",    limit: 32, null: false
    t.index ["persona_id"], name: "FK_REFERENCE_13", using: :btree
  end

  create_table "estado_pacientes", primary_key: "estado_paciente_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "consulta_id"
    t.time    "Stp_Hora_Inicio"
    t.string  "Stp_Via_Aerea",               limit: 2
    t.string  "Stp_Condicion_Llegada",       limit: 16
    t.string  "Stp_Forma_Llegada",           limit: 16
    t.time    "Stp_Hora_Salida"
    t.text    "Stp_Observacion_Salida",      limit: 4294967295
    t.string  "Stp_Condicion_Salida",        limit: 32
    t.string  "Stp_Nombre_Acompaniante",     limit: 64
    t.string  "Stp_Cedula_Acompaniante",     limit: 10
    t.string  "Stp_Parentesco_Acompaniante", limit: 16
    t.string  "Stp_Telefono_Acompaniante",   limit: 10
    t.index ["consulta_id"], name: "FK_REFERENCE_11", using: :btree
  end

  create_table "examen_fisicos", primary_key: "examen_fisico_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "consulta_id"
    t.text    "Efb_Observacion",          limit: 4294967295
    t.string  "Efb_Parte_CH",             limit: 32
    t.string  "Efb_Evidencia_Patologica", limit: 2
    t.string  "Efb_Categoria",            limit: 1
    t.index ["consulta_id"], name: "FK_REFERENCE_8", using: :btree
  end

  create_table "examenes", primary_key: "examen_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "prescripcion_id"
    t.text    "Exa_Descripcion", limit: 4294967295
    t.string  "Exa_Tipo",        limit: 32
    t.text    "Exa_Resultado",   limit: 4294967295
    t.index ["prescripcion_id"], name: "FK_REFERENCE_25", using: :btree
  end

  create_table "horarios", primary_key: "horario_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "medico_id"
    t.time    "Hor_Hora_Inicio"
    t.time    "Hor_Hora_Fin"
    t.string  "Hor_Dia",         limit: 16
    t.index ["medico_id"], name: "FK_REFERENCE_16", using: :btree
  end

  create_table "medicinas", primary_key: "medicina_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "prescripcion_id"
    t.string  "Ins_Nombre",      limit: 256
    t.string  "Ins_Indicacion",  limit: 512
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

  create_table "pacientes", primary_key: "paciente_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "Pac_HC",               limit: 8
    t.string   "Pac_Cedula",           limit: 10
    t.string   "Pac_Pasaporte",        limit: 16
    t.string   "Pac_Apellido_Paterno", limit: 32
    t.string   "Pac_Apellido_Materno", limit: 32
    t.string   "Pac_Nombres",          limit: 128
    t.date     "Pac_Fecha_Nacimiento"
    t.string   "Pac_Nacionalidad",     limit: 64
    t.string   "Pac_Genero",           limit: 1
    t.string   "Pac_Estado_Civil",     limit: 16
    t.string   "Pac_Instruccion",      limit: 16
    t.string   "Pac_Ocupacion",        limit: 128
    t.string   "Pac_Telefono",         limit: 10
    t.string   "Pac_Grupo_Sanguineo",  limit: 16
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "percances", primary_key: "percance_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "consulta_id"
    t.string  "Pca_Lugar_Evento",         limit: 256
    t.string  "Pca_Direccion_Evento",     limit: 256
    t.date    "Pca_Fecha"
    t.time    "Pca_Hora"
    t.string  "Pca_Tipo_Objeto",          limit: 64
    t.string  "Pca_Tipo_Evento",          limit: 64
    t.string  "Pca_Observacion",          limit: 512
    t.string  "Pca_Autoridad",            limit: 64
    t.time    "Pca_Hora_Denuncia"
    t.string  "Pca_Custodia_Policial",    limit: 1
    t.string  "Pca_Aliento_Etilico",      limit: 1
    t.decimal "Pca_Valor_Alcocheck",                  precision: 4, scale: 2
    t.time    "Pca_Hora_Examen"
    t.string  "Pca_Alcoholemia",          limit: 1
    t.string  "Pca_Otras",                limit: 512
    t.string  "Pca_Violencia_Tipo",       limit: 64
    t.integer "Pca_Grado_Quemadura"
    t.decimal "Pca_Quemadura_Porcentaje",             precision: 4, scale: 2
    t.string  "Pca_Picadura",             limit: 256
    t.string  "Pca_Mordedura",            limit: 256
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
    t.text    "Per_Observacion", limit: 4294967295
    t.index ["consulta_id"], name: "FK_REFERENCE_26", using: :btree
  end

  create_table "provincias", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id"
    t.text    "nombre",     limit: 65535
    t.text    "created_at", limit: 65535
    t.text    "updated_at", limit: 65535
  end

  create_table "residencias", primary_key: "residencia_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "paciente_id"
    t.string   "Res_Sector",           limit: 128
    t.string   "Res_Calle_Principal",  limit: 64
    t.string   "Res_Calle_Secundaria", limit: 64
    t.string   "Res_Numero_Casa",      limit: 8
    t.string   "Res_Provincia",        limit: 16
    t.string   "Res_Canton",           limit: 16
    t.datetime "creado_at"
    t.datetime "actualizado_at"
    t.integer  "user_id"
    t.index ["paciente_id"], name: "FK_REFERENCE_17", using: :btree
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
    t.string "Sin_Evolucion",        limit: 3
    t.string "Sin_Tipo",             limit: 4
    t.string "Sin_Modificaciones",   limit: 4
    t.string "Sin_Alivia",           limit: 3
    t.string "Sin_Intensidad",       limit: 4
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
  add_foreign_key "citas", "empleados", primary_key: "empleado_id", name: "FK_REFERENCE_14"
  add_foreign_key "citas", "medicos", primary_key: "medico_id", name: "FK_REFERENCE_15"
  add_foreign_key "citas", "pacientes", primary_key: "paciente_id", name: "FK_REFERENCE_4"
  add_foreign_key "consultas", "citas", primary_key: "cita_id", name: "FK_REFERENCE_3"
  add_foreign_key "diagnosticos", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_6"
  add_foreign_key "diagnosticos", "sintomas", primary_key: "sintoma_id", name: "FK_REFERENCE_5"
  add_foreign_key "empleados", "personas", primary_key: "persona_id", name: "FK_REFERENCE_13"
  add_foreign_key "estado_pacientes", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_11"
  add_foreign_key "examen_fisicos", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_8"
  add_foreign_key "examenes", "prescripciones", column: "prescripcion_id", primary_key: "prescripcion_id", name: "FK_REFERENCE_25"
  add_foreign_key "horarios", "medicos", primary_key: "medico_id", name: "FK_REFERENCE_16"
  add_foreign_key "medicinas", "prescripciones", column: "prescripcion_id", primary_key: "prescripcion_id", name: "FK_REFERENCE_23"
  add_foreign_key "medicos", "personas", primary_key: "persona_id", name: "FK_REFERENCE_12"
  add_foreign_key "percances", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_9"
  add_foreign_key "perfil_menus", "menus", primary_key: "menu_id", name: "FK_REFERENCE_22"
  add_foreign_key "perfil_menus", "perfiles", primary_key: "perfil_id", name: "FK_REFERENCE_21"
  add_foreign_key "personas", "usuarios", primary_key: "usuario_id", name: "FK_REFERENCE_19"
  add_foreign_key "prescripciones", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_26"
  add_foreign_key "residencias", "pacientes", primary_key: "paciente_id", name: "FK_REFERENCE_17"
  add_foreign_key "signos_vitales_basicos", "consultas", primary_key: "consulta_id", name: "FK_REFERENCE_10"
  add_foreign_key "terapias", "prescripciones", column: "prescripcion_id", primary_key: "prescripcion_id", name: "FK_REFERENCE_24"
  add_foreign_key "usuarios", "perfiles", primary_key: "perfil_id", name: "FK_REFERENCE_20"
end
