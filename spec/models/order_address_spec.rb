require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '購入' do
    context '購入できる場合' do
      it 'postal_code, prefecture_id, city, street, phone, user_id, item_id, tokenが存在していれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeはハイフンを含んだいないと保存できないこと' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は半角数字で入力してください（ハイフンが必要です）")
      end
      it 'postal_codeは全角だと保存できないこと' do
        @order_address.postal_code = "１２３４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は半角数字で入力してください（ハイフンが必要です）")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'prefecture_idは---が選択されている場合は保存できない' do
        @order_address.prefecture_id = "1"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'streetが空だと保存できないこと' do
        @order_address.street = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phoneが9桁以下だと保存できないこと' do
        @order_address.phone = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値である必要があります")
      end
      it 'phoneが11桁以下だと保存できないこと' do
        @order_address.phone = "123456789123"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値である必要があります")
      end
      it 'phoneは半角のみでないと保存できないこと' do
        @order_address.phone = "１２３４５６７８９０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値である必要があります")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end

    