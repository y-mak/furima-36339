require 'rails_helper'

RSpec.describe Record, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @record = FactoryBot.build(:record)
  end

  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@record).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @record.token = nil
      @record.valid?
      expect(@record.errors.full_messages).to include("Token can't be blank")
    end
    it "userが空では登録できないこと" do
      @record.user = nil
      @record.valid?
      expect(@record.errors.full_messages).to include("User must exist")
    end
    it "itemが空では登録できないこと" do
      @record.item = nil
      @record.valid?
      expect(@record.errors.full_messages).to include("Item must exist")
    end
  end
end