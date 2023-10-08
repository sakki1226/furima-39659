require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入' do
    context '購入できる場合' do
      it 'postal_code, prefecture_id, city, street, phone,user_id, tokenが存在していれば保存できる' do
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
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフンを含んだいないと保存できないこと' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeは全角だと保存できないこと' do
        @order_address.postal_code = "１２３４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idは---が選択されている場合は保存できない' do
        @order_address.prefecture_id = "0"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @order_address.street = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが9桁以下だと保存できないこと' do
        @order_address.phone = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone 電話番号は10桁以上11桁以内の半角数値である必要があります")
      end
      it 'phoneが11桁以下だと保存できないこと' do
        @order_address.phone = "123456789123"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone 電話番号は10桁以上11桁以内の半角数値である必要があります")
      end
      it 'phoneは半角のみでないと保存できないこと' do
        @order_address.phone = "１２３４５６７８９０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone 電話番号は10桁以上11桁以内の半角数値である必要があります")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

    