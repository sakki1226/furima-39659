FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 5 }
    city { '東京都' }
    street { '新宿区1-1-1' }
    building { '東京ビル' }
    phone { '00012345678' }
    
  end
end
