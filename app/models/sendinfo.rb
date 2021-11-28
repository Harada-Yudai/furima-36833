class Sendinfo < ApplicationRecord

  belongs_to :buylog
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
