# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create([{name: "会社・職業" },{name: "地域・文化" },  {name: "スポーツ" }, {name: "IT関係" },{name: "食" }, {name: "起業" }, {name: "災害" }, {name: "世界情勢" }, {name: "学問" }, {name: "政治" }, {name: "その他" }])

kind.create([{name: "会社" },{name: "人間関係" },  {name: "スポーツ" }, {name: "心と身体" },{name: "ネット関係" }, {name: "音楽" },{name: "テレビ" }, {name: "旅行" }, {name: "youtube" },{name: "恋愛" }, {name: "動物" },  {name: "芸能" }, {name: "趣味" }, {name: "その他" }])