class BuySend
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_num,:buylog_id, :user_id,:item_id

  with_options presence: true do
  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :city
  validates :block
  validates :phone_num, numericality: {only_integer: true}, length: { in: 10..11 }
  validates :user_id
  validates :item_id
  end
 

  def save
    # 各テーブルにデータを保存する処理を書く
    buylog = Buylog.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Sendinfo.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_num: phone_num, buylog_id: buylog.id)
  end
end

