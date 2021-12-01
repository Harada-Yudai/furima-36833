class CreateSendinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :sendinfos do |t|
      t.string     :postcode            , null: false
      t.integer    :prefecture_id   , null: false
      t.string     :city            , null: false
      t.string     :block           , null: false
      t.string     :building        , null: false
      t.string     :phone_num       , null: false
      t.references :buylog          , null: false, foreign_key: true
      t.timestamps
    end
  end
end
