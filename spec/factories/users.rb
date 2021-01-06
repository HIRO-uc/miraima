FactoryBot.define do
  factory :user do
    nickname { Faker::JapaneseMedia::Naruto.character }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { 'a1' + password }
    password_confirmation { 'a1' + password }
    type { Type.where.not(id: 0).sample }
    last_name { '山田' }
    first_name { '太郎' }
    birth_date { Faker::Date.between(from: '1930-01-01', to: "#{Time.now.year - 5}-12-31") }
  end
end