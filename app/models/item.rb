class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :area
  belongs_to :day

  validates :name, presence: true
  validates :comment, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :days_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, presence: true ,format: { with: /\A[0-9]+\z/ }
  validates :user, presence: true

  belongs_to :user
  has_one :record
  has_one_attached :image

end
