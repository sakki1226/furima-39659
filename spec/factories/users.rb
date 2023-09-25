FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'aaaa1111'}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'一郎'}
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'イチロウ'}
    birthday              {'19310101'}
  end
end
