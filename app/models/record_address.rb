class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :house_number, :building, :tel, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にハイフン（-）が含まれていません"}
    validates :area_id, numericality: {other_than: 1, message: "を入力してください"} 
    validates :municipalities
    validates :house_number
    validates :tel, format: {with: /\A\d{10,11}\z/, message: 'の入力が正しくありません'}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, house_number: house_number, building: building, tel: tel, record_id: record.id)
  end

end