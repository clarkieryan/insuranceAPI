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

ActiveRecord::Schema.define(version: 20131122120156) do

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_details", force: true do |t|
    t.integer  "customer_id"
    t.integer  "dob"
    t.integer  "telNumber"
    t.string   "street"
    t.string   "city"
    t.string   "county"
    t.string   "postCode"
    t.string   "licenceType"
    t.string   "licenceHeldSince"
    t.string   "occupation"
    t.integer  "quotesStored"
    t.integer  "incidents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "forename"
    t.string   "surname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quote_details", force: true do |t|
    t.integer  "customer_id"
    t.integer  "incidents_id"
    t.string   "vehicleReg"
    t.string   "estimatedMileage"
    t.string   "estimatedVehicleValue"
    t.string   "parkingLocation"
    t.integer  "policyExcess"
    t.integer  "breakdownCover"
    t.integer  "windscreenCover"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", force: true do |t|
    t.integer  "customer_id"
    t.integer  "incident_id"
    t.string   "vehicleReg"
    t.integer  "estimatedMileage"
    t.integer  "estimatedVehicleValue"
    t.string   "parkingLocation"
    t.integer  "policyExcess"
    t.boolean  "breakdownCover"
    t.boolean  "windscreenCover"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
