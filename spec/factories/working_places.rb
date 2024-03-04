FactoryBot.define do
  factory :working_place do
    sequence(:place) { |n| "Place #{n}" }
  end
end