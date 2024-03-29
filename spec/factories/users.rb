# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    active { false }
    type_user { [0, 5, 9, 16].sample }
  end
end
