class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :phone, :item_id, :user_id, :token, :price

  with_options presence: true do
    validates :city, :street, :item_id, :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "電話番号は10桁以上11桁以内の半角数値である必要があります" }
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, phone: phone, order_id: order.id)
  end
end