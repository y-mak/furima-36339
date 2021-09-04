class Item < ApplicationRecord
  validates :name, presence: true
  validates :comment, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :fee_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true ,format: { with: /\A[0-9]+\z/ }
  validates :user, presence: true

  belongs_to :user
  has_one :record
  has_one_attached :image

end
