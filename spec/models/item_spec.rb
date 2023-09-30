require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'item_name,price,explanation,category_id,condition_id,postage_id,prefecture_id,delivery_day_id,user_id,imageが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'item_nameが空では保存できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceに半角数字以外が含まれている場合は出品できない' do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが300円未満では出品できない' do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999円を超えると出品できない' do
        @item.price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end


      it 'explanationが空では保存できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idは---が選択されている場合は保存できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では保存できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_idは---が選択されている場合は保存できない' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'postage_idが空では保存できない' do
        @item.postage_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'postage_idは---が選択されている場合は保存できない' do
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idは---が選択されている場合は保存できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end


      it 'delivery_day_idが空では保存できない' do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'delivery_day_idは---が選択されている場合は保存できない' do
        @item.delivery_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end