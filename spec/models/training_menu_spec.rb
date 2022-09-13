require 'rails_helper'

RSpec.describe TrainingMenu, type: :model do
  before do
    @training_menu = FactoryBot.build(:training_menu)
  end
  describe 'トレーニングメニュー登録' do
    context '登録できるとき' do
      it 'nameとmuscle_category_idとexplanationが存在すれば登録できる' do
        expect(@training_menu).to be_valid
      end
    end

    context '登録できないとき' do
      it 'nameが空では登録できない' do
        @training_menu.name = ''
        @training_menu.valid?
        expect(@training_menu.errors.full_messages).to include("Name can't be blank")
      end
      it 'muscle_category_idが選択されてなければ登録できない' do
        @training_menu.muscle_category_id = ''
        @training_menu.valid?
        expect(@training_menu.errors.full_messages).to include("Muscle category can't be blank")
      end

      it 'explanationが空では登録できない' do
        @training_menu.explanation = ''
        @training_menu.valid?
        expect(@training_menu.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'userが紐づいてなければ登録できない' do
        @training_menu.user = nil
        @training_menu.valid?
        expect(@training_menu.errors.full_messages).to include('User must exist')
      end
    end
  end
end
