require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do   
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end 

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あいうえおかき'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end 

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end 

      it 'last_nameが空では登録できない' do 
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end 

      it 'first_nameは全角（漢字、ひらがな、カタカナ）でなければ登録できない' do 
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字is invalid. Input full-width characters.")
      end 

      it 'last_nameは全角（漢字、ひらがな、カタカナ）でなければ登録できない' do 
        @user.last_name = 'ichiro'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前is invalid. Input full-width characters.")
      end 

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end

      it 'first_name_kanaはカタカナでなければ登録できない' do 
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字is invalid. Input full-width characters.")
      end 

      it 'last_name_kanaはカタカナでなければ登録できない' do 
        @user.last_name = 'ichiro'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前is invalid. Input full-width characters.")
      end

      it 'birthdayは空では登録できない' do 
        @user.birthday = 'ichiro'
        @user.valid?  
        expect(@user.errors.full_messages).to include("誕生日を入力してください")       
      end
    end
  end
end