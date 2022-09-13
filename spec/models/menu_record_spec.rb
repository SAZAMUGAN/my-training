require 'rails_helper'

RSpec.describe MenuRecord, type: :model do
  before do
    @menu_record = FactoryBot.build(:menu_record)
  end
  describe 'トレーニングメニュー登録' do
    context '登録できるとき' do
      it 'dateとform_level_idが存在すれば登録できる' do
        expect(@menu_record).to be_valid
      end
    end

    context '登録できないとき' do
      it 'dateが空では登録できない' do
        @menu_record.date = ''
        @menu_record.valid?
        expect(@menu_record.errors.full_messages).to include("Date can't be blank")
      end
      it 'form_level_idが選択されてなければ登録できない' do
        @menu_record.form_level_id = ''
        @menu_record.valid?
        expect(@menu_record.errors.full_messages).to include("Form level can't be blank")
      end

      it 'userが紐づいてなければ登録できない' do
        @menu_record.user = nil
        @menu_record.valid?
        expect(@menu_record.errors.full_messages).to include("User must exist")
      end

      it 'training_menuが紐づいてなければ登録できない' do
        @menu_record.training_menu = nil
        @menu_record.valid?
        expect(@menu_record.errors.full_messages).to include("Training menu must exist")
      end
      
    end
  end
end
