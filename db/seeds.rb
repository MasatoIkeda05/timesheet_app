#ユーザー
User.create!(name:  "Example User",
             email: "example@kintai.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "Masato Ikeda",
             email: "masato@kintai.org",
             password:              "foobaz",
             password_confirmation: "foobaz",
             admin: false)

#勤務地
WorkingPlace.create!(place:  "東京新宿店", wage:  "1200")
WorkingPlace.create!(place:  "神戸六甲店", wage:  "1000")
WorkingPlace.create!(place:  "長野川中島店", wage:  "800")