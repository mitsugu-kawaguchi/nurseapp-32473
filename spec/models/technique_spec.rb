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
        expect(@technique.errors.full_messages).to include("タイトル名を入力してください")
      end
      it '優先度が空の時' do
        @technique.priority_id = nil
        @technique.valid?
        expect(@technique.errors.full_messages).to include("優先度を入力してください")
      end
      it '説明が空の時' do
        @technique.description = nil
        @technique.valid?
        expect(@technique.errors.full_messages).to include("技術の詳細を入力してください")
      end
      it '技術習得予定日が現在日より早い時' do
        @technique.target_at = '2020/02/30'
        @technique.valid?
        expect(@technique.errors.full_messages).to include("技術習得予定日は不正な値です")
      end
      it '技術習得締め日が技術習得予定日より早い時' do
        @technique.target_at = '2021/02/30'
        @technique.completed_at = '2021/01/30'
        @technique.valid?
        expect(@technique.errors.full_messages).to include("技術習得締め日は不正な値です")
      end
    end
  end
end
