# Use this file to import data from the CSV and populate your database

require "pg"
require "csv"
require "pry"

def db_connection
  begin
    connection = PG.connect(dbname: "building-database")
    yield(connection)
  ensure
    connection.close
  end
end

csv_records = CSV.readlines('data.csv', headers: true)

db_connection do |conn|
  # iterate over CSV data
  csv_records.each do |record|
    construction_type = record["construction_type"]
    zoning_type = record["zoning_type"]

    # determine if construction type exists in database
    construction_type_results = conn.exec_params(
      'SELECT name FROM construction_types WHERE name=$1',
      [construction_type]
    )

    # if there are no results
    if construction_type_results.to_a == []
      conn.exec_params(
        'INSERT INTO zoning_types (name) VALUES ($1)',
        [zoning_type]
      )
    end

    # determine if zoning type exists in database
    zoning_type_results = conn.exec_params(
      'SELECT name FROM zoning_types WHERE name=$1',
      [zoning_type]
    )

    # if there are no results
    if zoning_type_results.to_a == []
      conn.exec_params(
        'INSERT INTO zoning_types (name) VALUES ($1)',
        [zoning_type]
      )
    end

    # adding to accounts table
    owner = record["name"]
    zoning_type_id = conn.exec_params(
      'SELECT id FROM zoning_types WHERE name=$1',
      [zoning_type]
    )[0]['id']
    construction_type_id = conn.exec_params(
      'SELECT id FROM construction_types WHERE name=$1',
      [construction_type]
    )[0]['id']

    conn.exec_params(
      'INSERT INTO accounts (name, zoning_type_id, construction_type_id) VALUES ($1, $2, $3)',
      [owner, zoning_type_id, construction_type_id]
    )
  end
end

# My Way of doing it

# csv_records.each do |record|
#   record = record.to_h
#   zoning_types = nil
#   construction_types = nil
#   db_connection do |conn|
#     zoning_types = conn.exec("SELECT name FROM zoning_types").to_a
#   end
#   unless zoning_types.find {|zoning_type| zoning_type['name'] == record['zoning_type']}
#     db_connection do |conn|
#       conn.exec_params("INSERT INTO zoning_types (name) VALUES ($1)", [record['zoning_type']])
#     end
#   end
#   db_connection do |conn|
#     construction_types = conn.exec("SELECT name FROM construction_types").to_a
#   end
#   unless construction_types.find {|construction| construction['name'] == record['construction_type']}
#     db_connection do |conn|
#       conn.exec_params("INSERT INTO construction_types (name) VALUES ($1)", [record['construction_type']])
#     end
#   end
# end
