# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '投稿のテスト', type: :system do
  let!(:user) { create(:user) }
  let!(:game) { create(:game) }
  let!(:review) { create(:review, title:'hoge',body:'body') }

  describe 'トップ画面(root_path)のテスト', js: false do
    before do
      visit root_path
    end

    context '表示の確認' do
      scenario 'トップ画面にログイン・新規登録・ゲストログインページへのリンクが表示されているか' do
        expect(page).to have_link "", href: new_user_session_path
        expect(page).to have_link "", href: new_user_registration_path
        expect(page).to have_link "", href: guest_login_path
      end
    end

    context 'ゲストログイン機能' do
      scenario 'ゲストログイン後ゲストユーザーのレビュー一覧画面に偏移するか' do
        click_button 'ゲストとしてログイン'
        expect(page).to have_current_path user_path(User.last)
        expect(page).to have_content User.last.name
        expect(page).to have_content 'guestのレビュー一覧'
      end
    end

    context '通常ログイン機能' do
      let!(:login_user) { create(:user) }
      let!(:login_review) { create(:review, user: login_user, game: game) }
      scenario '通常ログイン後各ユーザーのレビュー一覧画面に偏移するか' do
        visit new_user_session_path
        fill_in 'user_email', with: login_user.email
        fill_in 'user_password', with: login_user.password
        click_button 'ログイン'
        expect(page).to have_current_path user_path(login_user)
        expect(page).to have_content login_user.name
        expect(page).to have_content "#{login_user.name}のレビュー一覧"
      end
    end
  end

  describe "投稿画面(game_path)のテスト", js: false do
    before do
      visit game_path(game)
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'review_title', with: Faker::Lorem.characters(number:10)
        fill_in 'review_body', with: Faker::Lorem.characters(number:30)
        fill_in 'review_rating', with: 4.0
        fill_in 'review_playtime', with: 60
        fill_in 'review_player', with: 2
        click_button '投稿'
        expect(page).to have_current_path review_path(Review.last)
      end
    end
  end
  
end