class Item < ApplicationRecord  
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :item_name, :price, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, :image,  presence: true

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
