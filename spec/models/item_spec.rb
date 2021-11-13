require 'rails_helper'


RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'オールok' do
    it '登録完了' do
      expect(@item).to be_valid
    end
  end
end
