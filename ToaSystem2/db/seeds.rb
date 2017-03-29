# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "Importando Provincias"
CSV.foreach(Rails.root.join("provincias.csv"), headers: true) do |row|
  Provincia.create! do |provincia|
    provincia.id = row[0]
    provincia.nombre = row[1]
  end
end

puts "Importando Cantones"
CSV.foreach(Rails.root.join("cantones.csv"), headers: true) do |row|
  Canton.create! do |canton|
    canton.nombre = row[0]
    canton.provincia_id = row[1]
  end
end