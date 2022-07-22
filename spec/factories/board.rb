FactoryBot.define do
  factory :board do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:body) { |n| "本文#{n}" }
    association :user
  end
end