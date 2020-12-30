require 'rails_helper'

RSpec.describe Technique, type: :model do
  before do
    @technique = FactoryBot.build(:technique)
  end
  describe "技術追加" do
    context '技術追加がうまくいく時' do
      it '入力欄全て正しく記入されていると新規登録できる' do
        expect(@technique).to be_valid
      end
    end
    context '技術追加がうまくいかない時' do
      it 'タイトルが空の時' do
        @technique.title = nil
        @technique.valid?
        expect(@technique.errors.full_messages).to include("Title can't be blank")
      end
      it '優先度が空の時' do
        @technique.priority_id = nil
        @technique.valid?
        expect(@technique.errors.full_messages).to include("Priority can't be blank")
      end
      it '説明が空の時' do
        @technique.description = nil
        @technique.valid?
        expect(@technique.errors.full_messages).to include("Description can't be blank")
      end
      it '技術習得予定日が現在日より早い時' do
        @technique.target_at = '2019/12/30'
        @technique.valid?
        expect(@technique.errors.full_messages).to include("Target at is invalid")
      end
      it '技術習得締め日が技術習得予定日より早い時' do
        @technique.target_at = '2020/12/31'
        @technique.completed_at = '2020/12/30'
        @technique.valid?
        expect(@technique.errors.full_messages).to include("Completed at is invalid")
      end
    end
  end
end
