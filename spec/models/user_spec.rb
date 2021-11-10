require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'オールok' do
    it '登録完了' do
      expect(@user).to be_valid
    end
  end

  describe 'ユーザー新規登録' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testexsample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  end

  describe '本人情報確認' do
      it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'ｱｱｱ'
        @user.first_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
        @user.last_kana = ''
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.last_kana = 'ｱｱｱ'
        @user.first_kana = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana には全角カタカナを使用してください")
        expect(@user.errors.full_messages).to include("First kana には全角カタカナを使用してください")
      end
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
  end
end
