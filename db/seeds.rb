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
