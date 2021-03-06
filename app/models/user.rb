class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' }
  validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/u, message: 'には全角カタカナを使用してください' }
  validates :first_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/u, message: 'には全角カタカナを使用してください' }
  validates :birthday, presence: true

  has_many :items
  has_many :buylogs
end
