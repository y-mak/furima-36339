class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_day
  belongs_to :user
  has_one :record
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 40 } 
  validates :comment, presence: true, length: { maximum: 1000 }   
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, presence: true ,format: { with: /\A[0-9]+\z/ }, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  validates :user, presence: true
  validates :image, presence: { message: 'をアップロードしてください' }
  
end
