# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genre_names = ["すごろく", "陣取り"]
genre_names.each { |name| Genre.create!(name: name) }

Game.create!(genre_id: 1, title: "sample1", body: "xxxxx")
Game.create!(genre_id: 2, title: "sample2", body: "xxxxx")
Game.create!(genre_id: 1, title: "sample3", body: "xxxxx")