require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  describe 'オールok' do
    it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること' do
      expect(@item).to be_valid
    end
  end

  describe '商品出品機能テスト' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること。' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態の情報が必須であること。' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担の情報が必須であること' do
      @item.ship_pay_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship pay can't be blank")
    end
    it '発送元の地域の情報が必須であること' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数の情報が必須であること' do
      @item.ship_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day can't be blank")
    end
    it '価格は、¥300以上のみ保存可能であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price を正しく入力してください')
    end
    it '価格は半角数値のみ保存可能であること。' do
      @item.price = "aaaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include('Price を正しく入力してください')
    end
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
