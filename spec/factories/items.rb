FactoryBot.define do
  factory :item do
    item_name        {'デザイン'}
    price            {'10000'}
    explanation      {'これはデザインです'}
    category_id      {3}
    condition_id     {3}
    postage_id       {3}
    prefecture_id    {3}
    delivery_day_id  {3}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
