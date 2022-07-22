FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "sample#{n}@example.com" }
    sequence(:first_name) { |n| "first_name{n}" }
    sequence(:last_name) { |n| "last_name{n}" }
    password { '12345678' }
    password_confirmation { '12345678' }
  end
end