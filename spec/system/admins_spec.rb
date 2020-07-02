require 'rails_helper'

describe '管理者の管理機能', type: :syetem do
    describe 'ログイン' do
        before do
            admin_a = FactoryBot.create(:admin, name: 'テスト　管理者A', email: 'a@example.com')
            admin_b = FactoryBot.create(:admin, name: 'テスト　管理者B', email: 'b@example.com')
            admin_c = FactoryBot.create(:admin, name: 'テスト　管理者C', email: 'c@example.com')
            visit new_admin_session_path
        end
        context '有効な管理者でログイン' do
            before do
               visit new_admin_session_path
               fill_in 'メールアドレス', with: 'a@example.com'
               fill_in 'パスワード', with: 'password'
               click_button 'ログイン'
            end
            subject { page }
            it 'Admins are listed' do
                is_expected.to have_content 'テスト　管理者A'
                is_expected.to have_content 'テスト　管理者B'
                is_expected.to have_content 'テスト　管理者C'
            end
        end
        context '無効な管理者でログイン' do 
            before do
                fill_in "メールアドレス" , with: ''
                fill_in "パスワード", with: ''
                click_button 'ログイン'
            end
            subject { page }
            it 'エラーメッセージの表示' do
                is_expected.to have_selector('.alert', text: 'メールアドレスまたはパスワードが違います。')
                is_expected.to have_current_path new_admin_session_path
            end
        end
    end
end