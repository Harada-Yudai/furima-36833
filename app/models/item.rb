class Item < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_pay_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :ship_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を正しく入力してください' }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
  has_one :buylog

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_pay
  belongs_to :prefecture
  belongs_to :ship_day
end
