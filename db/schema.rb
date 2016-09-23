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

ActiveRecord::Schema.define(version: 20160923044048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin1codesascii", primary_key: "geonameid", id: :integer, force: :cascade do |t|
    t.string "code",      limit: 20
    t.text   "name"
    t.text   "nameascii"
  end

  create_table "admin2codesascii", primary_key: "geonameid", id: :integer, force: :cascade do |t|
    t.string "code",      limit: 80
    t.text   "name"
    t.text   "nameascii"
  end

  create_table "adverts", force: :cascade do |t|
    t.string   "vehicle_type"
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["location_id"], name: "index_adverts_on_location_id", using: :btree
    t.index ["user_id"], name: "index_adverts_on_user_id", using: :btree
    t.index ["vehicle_type", "vehicle_id"], name: "index_adverts_on_vehicle_type_and_vehicle_id", using: :btree
  end

  create_table "alternatename", primary_key: "alternatenameid", id: :integer, force: :cascade do |t|
    t.integer "geonameid"
    t.string  "isolanguage",     limit: 7
    t.string  "alternatename",   limit: 300
    t.boolean "ispreferredname"
    t.boolean "isshortname"
    t.boolean "iscolloquial"
    t.boolean "ishistoric"
    t.index ["geonameid"], name: "index_alternatename_geonameid", using: :hash
  end

  create_table "bicycles", force: :cascade do |t|
    t.integer  "price"
    t.integer  "brand_id"
    t.integer  "c1",         limit: 2
    t.integer  "c2",         limit: 2
    t.integer  "c3",         limit: 2
    t.integer  "c4",         limit: 2
    t.integer  "c5",         limit: 2
    t.integer  "c6",         limit: 2
    t.integer  "c7",         limit: 2
    t.boolean  "c8"
    t.boolean  "c9"
    t.boolean  "c10"
    t.integer  "c11",        limit: 2
    t.integer  "c12",        limit: 2
    t.integer  "c13",        limit: 2
    t.integer  "c14",        limit: 2
    t.decimal  "c15"
    t.decimal  "c16"
    t.integer  "c17",        limit: 2
    t.integer  "c18",        limit: 2
    t.boolean  "c19"
    t.integer  "c20",        limit: 2
    t.integer  "c21",        limit: 2
    t.boolean  "c22"
    t.boolean  "c23"
    t.boolean  "c24"
    t.boolean  "c25"
    t.boolean  "c26"
    t.integer  "c27",        limit: 2
    t.boolean  "c28"
    t.boolean  "c29"
    t.boolean  "c30"
    t.boolean  "c31"
    t.boolean  "c32"
    t.integer  "c33",        limit: 2
    t.integer  "c34",        limit: 2
    t.boolean  "c35"
    t.boolean  "c36"
    t.boolean  "c37"
    t.boolean  "c38"
    t.integer  "c39",        limit: 2
    t.integer  "c40",        limit: 2
    t.integer  "c41",        limit: 2
    t.integer  "c42",        limit: 2
    t.integer  "c43",        limit: 2
    t.integer  "c44",        limit: 2
    t.integer  "c45",        limit: 2
    t.integer  "c46",        limit: 2
    t.integer  "c47",        limit: 2
    t.integer  "c48",        limit: 2
    t.integer  "c49",        limit: 2
    t.integer  "c50",        limit: 2
    t.boolean  "c51"
    t.integer  "c52",        limit: 2
    t.integer  "c53",        limit: 2
    t.integer  "c54",        limit: 2
    t.integer  "c55",        limit: 2
    t.integer  "c56",        limit: 2
    t.integer  "c57",        limit: 2
    t.integer  "c58",        limit: 2
    t.integer  "c59",        limit: 2
    t.integer  "c60",        limit: 2
    t.boolean  "c61"
    t.boolean  "c62"
    t.boolean  "c63"
    t.integer  "c64",        limit: 2
    t.integer  "c65",        limit: 2
    t.integer  "c66",        limit: 2
    t.boolean  "c67"
    t.boolean  "c68"
    t.integer  "c69",        limit: 2
    t.integer  "c70",        limit: 2
    t.integer  "c71",        limit: 2
    t.boolean  "c72"
    t.boolean  "c73"
    t.boolean  "c74"
    t.boolean  "c75"
    t.boolean  "c76"
    t.boolean  "c77"
    t.boolean  "c78"
    t.integer  "c79",        limit: 2
    t.integer  "c80",        limit: 2
    t.decimal  "c81"
    t.decimal  "c82"
    t.decimal  "c83"
    t.boolean  "c84"
    t.boolean  "c85"
    t.boolean  "c86"
    t.integer  "c87",        limit: 2
    t.boolean  "c88"
    t.boolean  "c89"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["brand_id"], name: "index_bicycles_on_brand_id", using: :btree
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_popular"
    t.boolean  "is_velomobile"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "cities", primary_key: "geonameid", id: :integer, force: :cascade do |t|
    t.string  "name",           limit: 200
    t.string  "asciiname",      limit: 200
    t.string  "alternatenames", limit: 4000
    t.float   "latitude"
    t.float   "longitude"
    t.string  "fclass",         limit: 1
    t.string  "fcode",          limit: 10
    t.string  "country",        limit: 2
    t.string  "cc2",            limit: 100
    t.string  "admin1",         limit: 20
    t.string  "admin2",         limit: 80
    t.string  "admin3",         limit: 20
    t.string  "admin4",         limit: 20
    t.integer "population"
    t.integer "elevation"
    t.integer "gtopo30"
    t.string  "timezone",       limit: 40
    t.date    "moddate"
  end

  create_table "continentcodes", primary_key: "geonameid", id: :integer, force: :cascade do |t|
    t.string "code", limit: 2
    t.string "name", limit: 20
  end

  create_table "countryinfo", primary_key: "iso_alpha2", id: :string, limit: 2, force: :cascade do |t|
    t.string  "iso_alpha3",           limit: 3
    t.integer "iso_numeric"
    t.string  "fips_code",            limit: 3
    t.string  "country",              limit: 200
    t.string  "capital",              limit: 200
    t.float   "areainsqkm"
    t.integer "population"
    t.string  "continent",            limit: 2
    t.string  "tld",                  limit: 10
    t.string  "currency_code",        limit: 3
    t.string  "currency_name",        limit: 15
    t.string  "phone",                limit: 20
    t.string  "postal",               limit: 60
    t.string  "postalregex",          limit: 200
    t.string  "languages",            limit: 200
    t.integer "geonameid"
    t.string  "neighbours",           limit: 50
    t.string  "equivalent_fips_code", limit: 3
    t.index ["geonameid"], name: "index_countryinfo_geonameid", using: :hash
  end

  create_table "featurecodes", id: false, force: :cascade do |t|
    t.string "code",        limit: 7
    t.string "name",        limit: 200
    t.text   "description"
    t.index ["code"], name: "featurecodes_code_idx", using: :btree
  end

  create_table "geoname", primary_key: "geonameid", id: :integer, force: :cascade do |t|
    t.string  "name",           limit: 200
    t.string  "asciiname",      limit: 200
    t.text    "alternatenames"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "fclass",         limit: 1
    t.string  "fcode",          limit: 10
    t.string  "country",        limit: 2
    t.string  "cc2",            limit: 100
    t.string  "admin1",         limit: 20
    t.string  "admin2",         limit: 80
    t.string  "admin3",         limit: 20
    t.string  "admin4",         limit: 20
    t.bigint  "population"
    t.integer "elevation"
    t.integer "gtopo30"
    t.string  "timezone",       limit: 40
    t.date    "moddate"
  end

  create_table "hierarchy", primary_key: ["parentid", "childid"], force: :cascade do |t|
    t.integer "parentid",            null: false
    t.integer "childid",             null: false
    t.string  "type",     limit: 50
  end

  create_table "iso_languagecodes", primary_key: "iso_639_3", id: :string, limit: 4, force: :cascade do |t|
    t.string "iso_639_2",     limit: 50
    t.string "iso_639_1",     limit: 50
    t.string "language_name", limit: 200
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "geoname_id"
    t.string   "name"
    t.string   "ascii_name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "country"
    t.integer  "population"
    t.string   "timezone"
    t.boolean  "is_edited"
    t.string   "code"
    t.integer  "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent"], name: "index_locations_on_parent", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "advert_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["advert_id"], name: "index_photos_on_advert_id", using: :btree
  end

  create_table "postalcodes", id: false, force: :cascade do |t|
    t.string  "countrycode", limit: 2
    t.string  "postalcode",  limit: 20
    t.string  "placename",   limit: 180
    t.string  "admin1name",  limit: 100
    t.string  "admin1code",  limit: 20
    t.string  "admin2name",  limit: 100
    t.string  "admin2code",  limit: 20
    t.string  "admin3name",  limit: 100
    t.string  "admin3code",  limit: 20
    t.float   "latitude"
    t.float   "longitude"
    t.integer "accuracy",    limit: 2
  end

  create_table "timezones", id: false, force: :cascade do |t|
    t.string  "country",    limit: 2
    t.string  "timezoneid", limit: 200
    t.decimal "gmt_offset",             precision: 3, scale: 1
    t.decimal "dst_offset",             precision: 3, scale: 1
    t.decimal "raw_offset",             precision: 3, scale: 1
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 50, null: false
    t.string   "phone"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "locale",          limit: 2
  end

  create_table "velomobiles", force: :cascade do |t|
    t.integer  "price"
    t.integer  "brand_id"
    t.integer  "c1",         limit: 2
    t.integer  "c2",         limit: 2
    t.integer  "c3",         limit: 2
    t.integer  "c4",         limit: 2
    t.integer  "c5",         limit: 2
    t.integer  "c6",         limit: 2
    t.integer  "c7",         limit: 2
    t.decimal  "c8"
    t.integer  "c9",         limit: 2
    t.integer  "c10",        limit: 2
    t.boolean  "c11"
    t.boolean  "c12"
    t.integer  "c13",        limit: 2
    t.integer  "c14",        limit: 2
    t.integer  "c15",        limit: 2
    t.integer  "c16",        limit: 2
    t.integer  "c17",        limit: 2
    t.integer  "c18",        limit: 2
    t.integer  "c19",        limit: 2
    t.integer  "c20",        limit: 2
    t.integer  "c21",        limit: 2
    t.integer  "c22",        limit: 2
    t.integer  "c23",        limit: 2
    t.boolean  "c24"
    t.integer  "c25",        limit: 2
    t.integer  "c26",        limit: 2
    t.integer  "c27",        limit: 2
    t.integer  "c28",        limit: 2
    t.integer  "c29",        limit: 2
    t.integer  "c30",        limit: 2
    t.integer  "c31",        limit: 2
    t.integer  "c32",        limit: 2
    t.integer  "c33",        limit: 2
    t.boolean  "c34"
    t.boolean  "c35"
    t.integer  "c36",        limit: 2
    t.integer  "c37",        limit: 2
    t.integer  "c38",        limit: 2
    t.boolean  "c39"
    t.boolean  "c40"
    t.integer  "c41",        limit: 2
    t.boolean  "c42"
    t.boolean  "c43"
    t.boolean  "c44"
    t.integer  "c49",        limit: 2
    t.integer  "c45",        limit: 2
    t.integer  "c46",        limit: 2
    t.integer  "c47",        limit: 2
    t.integer  "c48",        limit: 2
    t.decimal  "c50"
    t.decimal  "c51"
    t.boolean  "c52"
    t.integer  "c53",        limit: 2
    t.boolean  "c54"
    t.boolean  "c55"
    t.decimal  "c56"
    t.boolean  "c57"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["brand_id"], name: "index_velomobiles_on_brand_id", using: :btree
  end

  add_foreign_key "adverts", "locations"
  add_foreign_key "adverts", "users"
  add_foreign_key "alternatename", "geoname", column: "geonameid", primary_key: "geonameid", name: "fk_geonameid"
  add_foreign_key "bicycles", "brands"
  add_foreign_key "countryinfo", "geoname", column: "geonameid", primary_key: "geonameid", name: "fk_geonameid"
  add_foreign_key "photos", "adverts"
  add_foreign_key "velomobiles", "brands"
end
