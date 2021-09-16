class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :house_number, :building, :tel, :record_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"} 
    validates :municipalities
    validates :house_number
    validates :tel, format: {with: /\A\d{10,11}\z/, message: 'is invalid'}
    validates :item_id
    validates :user_id
    validates :token
    #validates :record_id
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, house_number: house_number, building: building, tel: tel, record_id: record.id)
  end

end