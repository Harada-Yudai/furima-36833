require 'rails_helper'

RSpec.describe BuySend, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_send = FactoryBot.build(:buy_send, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_send).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_send.building = ''
        expect(@buy_send).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が必須であること' do
        @buy_send.postcode = ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @buy_send.postcode = '1234567'
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が必須であること' do
        @buy_send.prefecture_id = '0'
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須であること' do
        @buy_send.city = ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @buy_send.block = ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が必須であること' do
        @buy_send.phone_num = ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @buy_send.phone_num = '111111111'
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include('Phone num is too short (minimum is 10 characters)')
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @buy_send.phone_num = '111111111111'
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include('Phone num is too long (maximum is 11 characters)')
      end
      it '電話番号は、半角数値のみ保存可能なこと' do
        @buy_send.phone_num = 'aaaaaaaaaaa'
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include('Phone num is not a number')
      end
      it 'tokenが空では登録できないこと' do
        @buy_send.token = nil
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
