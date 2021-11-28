require 'rails_helper'

RSpec.describe BuySend, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_send = FactoryBot.build(:buy_send, user_id: user.id, item_id: item.id)
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
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      end
      it '都道府県が必須であること' do
      end
      it '市区町村が必須であること' do
      end
      it '番地が必須であること' do
      end
      it '電話番号が必須であること' do
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      end
    end
  end
end
