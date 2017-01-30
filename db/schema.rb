# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161210230651) do

  create_table "asignaturas", force: :cascade do |t|
    t.string   "asignaturaID", limit: 255
    t.string   "nombre",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "aulas", force: :cascade do |t|
    t.string   "aulaID",     limit: 255
    t.string   "profesorID", limit: 255
    t.string   "grado",      limit: 255
    t.boolean  "actual"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "cursoID",      limit: 255
    t.string   "asignaturaID", limit: 255
    t.string   "profesorID",   limit: 255
    t.string   "aulaID",       limit: 255
    t.string   "horario",      limit: 255
    t.boolean  "activo"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "horas", force: :cascade do |t|
    t.string   "titulo",     limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "inscripcions", force: :cascade do |t|
    t.string   "cursoID",      limit: 255
    t.string   "alumnoID",     limit: 255
    t.integer  "periodo",      limit: 4
    t.float    "eval1",        limit: 24,  default: 0.0
    t.float    "eval2",        limit: 24,  default: 0.0
    t.float    "eval3",        limit: 24,  default: 0.0
    t.float    "eval4",        limit: 24,  default: 0.0
    t.float    "eval5",        limit: 24,  default: 0.0
    t.float    "eval6",        limit: 24,  default: 0.0
    t.float    "eval7",        limit: 24,  default: 0.0
    t.float    "eval8",        limit: 24,  default: 0.0
    t.float    "eval9",        limit: 24,  default: 0.0
    t.float    "nota_periodo", limit: 24,  default: 0.0
    t.boolean  "activo"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "titulo",     limit: 255
    t.string   "contenido",  limit: 255
    t.string   "foto",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",            limit: 255
    t.string   "uid",                 limit: 255
    t.string   "name",                limit: 255
    t.string   "oauth_token",         limit: 255
    t.datetime "oauth_expires_at"
    t.string   "email",               limit: 255
    t.string   "rol",                 limit: 255
    t.string   "carnet",              limit: 255
    t.string   "profesorID",          limit: 255
    t.string   "grado",               limit: 255
    t.string   "foto",                limit: 255
    t.date     "fecha_nac"
    t.string   "Centro_esc_ant",      limit: 255
    t.string   "religion",            limit: 255
    t.string   "colonia",             limit: 255
    t.string   "departamento",        limit: 255
    t.string   "municipio",           limit: 255
    t.string   "barrio",              limit: 255
    t.string   "tel_casa",            limit: 255
    t.string   "enfermedades",        limit: 255
    t.string   "nombre_padre",        limit: 255
    t.string   "tel_padre",           limit: 255
    t.string   "correo_padre",        limit: 255
    t.string   "ocupacion_padre",     limit: 255
    t.string   "lugar_trabajo_padre", limit: 255
    t.string   "nombre_madre",        limit: 255
    t.string   "tel_madre",           limit: 255
    t.string   "correo_madre",        limit: 255
    t.string   "ocupacion_madre",     limit: 255
    t.string   "lugar_trabajo_madre", limit: 255
    t.string   "nombre_enc",          limit: 255
    t.string   "tel_enc",             limit: 255
    t.string   "correo_enc",          limit: 255
    t.string   "en_caso_emergencia",  limit: 255
    t.string   "tel_emergencia",      limit: 255
    t.string   "activo",              limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
