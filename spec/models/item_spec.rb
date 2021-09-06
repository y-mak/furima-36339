require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品できる場合' do
      it '全ての情報がルール通り入っていると新規登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品できない場合' do
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が41文字以上では登録できない' do
        @item.name = 'あ' *41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it '商品の説明が必須であること' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it '商品の説明が1001文字以上では登録できない' do
        @item.comment = 'あ' *1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment is too long (maximum is 1000 characters)")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーの情報が「--」では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須であること' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '商品の状態の情報が「--」では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報が必須であること' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it '配送料の負担の情報が「--」では登録できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it '発送元の地域の情報が必須であること' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送元の地域の情報が「--」では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数の情報が必須であること' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it '発送の日数の情報が「--」では登録できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it '価格の情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では登録できない' do
        @item.price = '290'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が10,000,000円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格に全角が入ると保存できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格に英字・かな・漢字・カタカナが入ると保存できない' do
        @item.price = 'aAかツ11'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image をアップロードしてください")
      end
      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end