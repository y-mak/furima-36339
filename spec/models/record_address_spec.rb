require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入できる場合' do
      it '全ての情報がルール通り入っていると商品購入できる（建物名入力）' do
        expect(@record_address).to be_valid
      end
      it '全ての情報がルール通り入っていると商品購入できる（建物名未入力）' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it '郵便番号が必須であること' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号は、「3桁ハイフン4桁」のみ保存可能なこと' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @record_address.postal_code = '１２３−ＡＢcd'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が必須であること' do
        @record_address.area_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が必須であること' do
        @record_address.municipalities = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が必須であること' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が必須であること' do
        @record_address.tel = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @record_address.tel = '090-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Tel is invalid")
      end
    end
  end
end

