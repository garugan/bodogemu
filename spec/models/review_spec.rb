# frozen_string_literal: true

require 'rails_helper'

describe 'レビューモデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:review)).to be_valid
  end

  it "タイトルが空欄なら保存できない" do
    review = build(:review, title: "")
    expect(review).to_not be_valid
  end

  it "本文が空欄なら保存できない" do
    review = build(:review, body: "")
    expect(review).to_not be_valid
  end

end
