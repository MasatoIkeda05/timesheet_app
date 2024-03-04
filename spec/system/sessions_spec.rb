require 'rails_helper'

describe 'ログイン機能', type: :system do
  let(:user) { FactoryBot.create(:user) }


  context 'メールアドレスとパスワードが正しい時' do
    before do
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it '勤怠登録画面に移動する' do
      expect(page).to have_current_path(user_path(user))
      expect(page).to have_content '勤怠登録'
    end
  end

  context 'メールアドレスとパスワードが正しくない時' do
    before do
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'wrong_pass'
      click_button 'Log in'
    end

    it 'ログインできない' do
      expect(page).to have_current_path(login_path)
      expect(page).to have_content 'メールアドレスまたはパスワードが間違っています。'
    end
  end
end