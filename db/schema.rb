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

ActiveRecord::Schema.define(version: 20171107193931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin1codesascii", primary_key: "geonameid", id: :integer, default: nil, force: :cascade do |t|
    t.string "code", limit: 20
    t.text "name"
    t.text "nameascii"
  end

  create_table "admin2codesascii", primary_key: "geonameid", id: :integer, default: nil, force: :cascade do |t|
    t.string "code", limit: 80
    t.text "name"
    t.text "nameascii"
  end

  create_table "adverts", id: :serial, force: :cascade do |t|
    t.string "vehicle_type"
    t.integer "vehicle_id"
    t.integer "user_id"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "model"
    t.integer "year"
    t.string "state"
    t.string "color"
    t.integer "mileage"
    t.integer "country_id"
    t.string "place"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.boolean "is_exchange"
    t.string "time"
    t.integer "count"
    t.string "description"
    t.integer "price"
    t.integer "brand_id"
    t.boolean "is_domestic_delivery"
    t.boolean "is_delivery_abroad"
    t.boolean "is_around_the_clock"
    t.bigint "currency_id"
    t.index ["brand_id"], name: "index_adverts_on_brand_id"
    t.index ["currency_id"], name: "index_adverts_on_currency_id"
    t.index ["location_id"], name: "index_adverts_on_location_id"
    t.index ["user_id"], name: "index_adverts_on_user_id"
    t.index ["vehicle_type", "vehicle_id"], name: "index_adverts_on_vehicle_type_and_vehicle_id"
  end

  create_table "alternatename", primary_key: "alternatenameid", id: :integer, default: nil, force: :cascade do |t|
    t.integer "geonameid"
    t.string "isolanguage", limit: 7
    t.string "alternatename", limit: 300
    t.boolean "ispreferredname"
    t.boolean "isshortname"
    t.boolean "iscolloquial"
    t.boolean "ishistoric"
    t.index ["geonameid"], name: "index_alternatename_geonameid", using: :hash
  end

  create_table "bicycles", id: :serial, force: :cascade do |t|
    t.integer "c1", limit: 2
    t.integer "c2", limit: 2
    t.integer "c3", limit: 2
    t.integer "c4", limit: 2
    t.integer "c5", limit: 2
    t.integer "c6", limit: 2
    t.integer "c7", limit: 2
    t.boolean "c8"
    t.boolean "c9"
    t.boolean "c10"
    t.integer "c11", limit: 2
    t.integer "c12", limit: 2
    t.integer "c13", limit: 2
    t.integer "c14", limit: 2
    t.decimal "c15"
    t.decimal "c16"
    t.integer "c17", limit: 2
    t.integer "c18", limit: 2
    t.boolean "c19"
    t.integer "c20", limit: 2
    t.integer "c21", limit: 2
    t.boolean "c22"
    t.boolean "c23"
    t.boolean "c24"
    t.boolean "c25"
    t.boolean "c26"
    t.integer "c27", limit: 2
    t.boolean "c28"
    t.boolean "c29"
    t.boolean "c30"
    t.boolean "c31"
    t.boolean "c32"
    t.integer "c33", limit: 2
    t.integer "c34", limit: 2
    t.boolean "c35"
    t.boolean "c36"
    t.boolean "c37"
    t.boolean "c38"
    t.integer "c39", limit: 2
    t.integer "c40", limit: 2
    t.integer "c41", limit: 2
    t.integer "c42", limit: 2
    t.integer "c43", limit: 2
    t.integer "c44", limit: 2
    t.integer "c45", limit: 2
    t.integer "c46", limit: 2
    t.integer "c47", limit: 2
    t.integer "c48", limit: 2
    t.integer "c49", limit: 2
    t.integer "c50", limit: 2
    t.boolean "c51"
    t.integer "c52", limit: 2
    t.integer "c53", limit: 2
    t.integer "c54", limit: 2
    t.integer "c55", limit: 2
    t.integer "c56", limit: 2
    t.integer "c57", limit: 2
    t.integer "c58", limit: 2
    t.integer "c59", limit: 2
    t.integer "c60", limit: 2
    t.boolean "c61"
    t.boolean "c62"
    t.boolean "c63"
    t.integer "c64", limit: 2
    t.integer "c65", limit: 2
    t.integer "c66", limit: 2
    t.boolean "c67"
    t.boolean "c68"
    t.integer "c69", limit: 2
    t.integer "c70", limit: 2
    t.integer "c71", limit: 2
    t.boolean "c72"
    t.boolean "c73"
    t.boolean "c74"
    t.boolean "c75"
    t.boolean "c76"
    t.boolean "c77"
    t.boolean "c78"
    t.integer "c79", limit: 2
    t.integer "c80", limit: 2
    t.decimal "c81"
    t.decimal "c82"
    t.decimal "c83"
    t.boolean "c84"
    t.boolean "c85"
    t.boolean "c86"
    t.integer "c87", limit: 2
    t.boolean "c88"
    t.boolean "c89"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "c90"
    t.boolean "c91"
    t.boolean "c92"
    t.boolean "c93"
    t.boolean "c94"
    t.boolean "c95"
    t.boolean "c96"
    t.boolean "c97"
    t.string "c98"
    t.boolean "c99"
    t.string "c100"
  end

  create_table "brands", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "is_popular"
    t.boolean "is_velomobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "by_localities", id: :serial, force: :cascade do |t|
    t.integer "geoname_id"
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_by_localities_on_parent_id"
  end

  create_table "cities", primary_key: "geonameid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 200
    t.string "asciiname", limit: 200
    t.string "alternatenames", limit: 4000
    t.float "latitude"
    t.float "longitude"
    t.string "fclass", limit: 1
    t.string "fcode", limit: 10
    t.string "country", limit: 2
    t.string "cc2", limit: 100
    t.string "admin1", limit: 20
    t.string "admin2", limit: 80
    t.string "admin3", limit: 20
    t.string "admin4", limit: 20
    t.integer "population"
    t.integer "elevation"
    t.integer "gtopo30"
    t.string "timezone", limit: 40
    t.date "moddate"
  end

  create_table "continentcodes", primary_key: "geonameid", id: :integer, default: nil, force: :cascade do |t|
    t.string "code", limit: 2
    t.string "name", limit: 20
  end

  create_table "countries", id: :serial, force: :cascade do |t|
    t.integer "geoname_id"
    t.string "name"
    t.string "code"
    t.string "isolanguage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countryinfo", primary_key: "iso_alpha2", id: :string, limit: 2, force: :cascade do |t|
    t.string "iso_alpha3", limit: 3
    t.integer "iso_numeric"
    t.string "fips_code", limit: 3
    t.string "country", limit: 200
    t.string "capital", limit: 200
    t.float "areainsqkm"
    t.integer "population"
    t.string "continent", limit: 2
    t.string "tld", limit: 10
    t.string "currency_code", limit: 3
    t.string "currency_name", limit: 15
    t.string "phone", limit: 20
    t.string "postal", limit: 60
    t.string "postalregex", limit: 200
    t.string "languages", limit: 200
    t.integer "geonameid"
    t.string "neighbours", limit: 50
    t.string "equivalent_fips_code", limit: 3
    t.index ["geonameid"], name: "index_countryinfo_geonameid", using: :hash
  end

  create_table "currencies", id: :serial, force: :cascade do |t|
    t.string "code"
    t.string "symbol"
    t.decimal "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "featurecodes", id: false, force: :cascade do |t|
    t.string "code", limit: 7
    t.string "name", limit: 200
    t.text "description"
    t.index ["code"], name: "featurecodes_code_idx"
  end

  create_table "ge_localities", id: :serial, force: :cascade do |t|
    t.integer "geoname_id"
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_ge_localities_on_parent_id"
  end

  create_table "geoname", primary_key: "geonameid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 200
    t.string "asciiname", limit: 200
    t.text "alternatenames"
    t.float "latitude"
    t.float "longitude"
    t.string "fclass", limit: 1
    t.string "fcode", limit: 10
    t.string "country", limit: 2
    t.string "cc2", limit: 100
    t.string "admin1", limit: 20
    t.string "admin2", limit: 80
    t.string "admin3", limit: 20
    t.string "admin4", limit: 20
    t.bigint "population"
    t.integer "elevation"
    t.integer "gtopo30"
    t.string "timezone", limit: 40
    t.date "moddate"
  end

  create_table "hierarchy", primary_key: ["parentid", "childid"], force: :cascade do |t|
    t.integer "parentid", null: false
    t.integer "childid", null: false
    t.string "type", limit: 50
  end

  create_table "iso_languagecodes", primary_key: "iso_639_3", id: :string, limit: 4, force: :cascade do |t|
    t.string "iso_639_2", limit: 50
    t.string "iso_639_1", limit: 50
    t.string "language_name", limit: 200
  end

  create_table "kz_localities", id: :serial, force: :cascade do |t|
    t.integer "geoname_id"
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_kz_localities_on_parent_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.integer "geoname_id"
    t.string "name"
    t.string "ascii_name"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "country"
    t.integer "population"
    t.string "timezone"
    t.boolean "is_edited"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.integer "references_id"
    t.index ["parent_id"], name: "index_locations_on_parent_id"
    t.index ["references_id"], name: "index_locations_on_references_id"
  end

  create_table "photos", id: :serial, force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "advert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advert_id"], name: "index_photos_on_advert_id"
  end

  create_table "postalcodes", id: false, force: :cascade do |t|
    t.string "countrycode", limit: 2
    t.string "postalcode", limit: 20
    t.string "placename", limit: 180
    t.string "admin1name", limit: 100
    t.string "admin1code", limit: 20
    t.string "admin2name", limit: 100
    t.string "admin2code", limit: 20
    t.string "admin3name", limit: 100
    t.string "admin3code", limit: 20
    t.float "latitude"
    t.float "longitude"
    t.integer "accuracy", limit: 2
  end

  create_table "ru_localities", id: :serial, force: :cascade do |t|
    t.integer "geoname_id"
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_ru_localities_on_parent_id"
  end

  create_table "timezones", id: false, force: :cascade do |t|
    t.string "country", limit: 2
    t.string "timezoneid", limit: 200
    t.decimal "gmt_offset", precision: 3, scale: 1
    t.decimal "dst_offset", precision: 3, scale: 1
    t.decimal "raw_offset", precision: 3, scale: 1
  end

  create_table "ua_localities", id: :serial, force: :cascade do |t|
    t.integer "geoname_id"
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_ua_localities_on_parent_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "phone"
    t.string "email"
    t.string "password_digest"
    t.string "locale", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "velomobiles", id: :serial, force: :cascade do |t|
    t.integer "c1", limit: 2
    t.integer "c2", limit: 2
    t.integer "c3", limit: 2
    t.integer "c4", limit: 2
    t.integer "c5", limit: 2
    t.integer "c6", limit: 2
    t.integer "c7", limit: 2
    t.decimal "c8"
    t.integer "c9", limit: 2
    t.integer "c10", limit: 2
    t.boolean "c11"
    t.boolean "c12"
    t.integer "c13", limit: 2
    t.integer "c14", limit: 2
    t.integer "c15", limit: 2
    t.integer "c16", limit: 2
    t.integer "c17", limit: 2
    t.integer "c18", limit: 2
    t.integer "c19", limit: 2
    t.integer "c20", limit: 2
    t.integer "c21", limit: 2
    t.integer "c22", limit: 2
    t.integer "c23", limit: 2
    t.boolean "c24"
    t.integer "c25", limit: 2
    t.integer "c26", limit: 2
    t.integer "c27", limit: 2
    t.integer "c28", limit: 2
    t.integer "c29", limit: 2
    t.integer "c30", limit: 2
    t.integer "c31", limit: 2
    t.integer "c32", limit: 2
    t.integer "c33", limit: 2
    t.boolean "c34"
    t.boolean "c35"
    t.integer "c36", limit: 2
    t.integer "c37", limit: 2
    t.integer "c38", limit: 2
    t.boolean "c39"
    t.boolean "c40"
    t.integer "c41", limit: 2
    t.boolean "c42"
    t.boolean "c43"
    t.boolean "c44"
    t.integer "c49", limit: 2
    t.integer "c45", limit: 2
    t.integer "c46", limit: 2
    t.integer "c47", limit: 2
    t.integer "c48", limit: 2
    t.decimal "c50"
    t.decimal "c51"
    t.boolean "c52"
    t.integer "c53", limit: 2
    t.boolean "c54"
    t.boolean "c55"
    t.decimal "c56"
    t.boolean "c57"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "adverts", "brands"
  add_foreign_key "adverts", "currencies"
  add_foreign_key "adverts", "locations"
  add_foreign_key "adverts", "users"
  add_foreign_key "alternatename", "geoname", column: "geonameid", primary_key: "geonameid", name: "fk_geonameid"
  add_foreign_key "by_localities", "by_localities", column: "parent_id"
  add_foreign_key "countryinfo", "geoname", column: "geonameid", primary_key: "geonameid", name: "fk_geonameid"
  add_foreign_key "ge_localities", "ge_localities", column: "parent_id"
  add_foreign_key "kz_localities", "kz_localities", column: "parent_id"
  add_foreign_key "photos", "adverts"
  add_foreign_key "ru_localities", "ru_localities", column: "parent_id"
  add_foreign_key "ua_localities", "ua_localities", column: "parent_id"
end
