require 'rails_helper'

describe 'Admins management function', type: :syetem do
    describe 'sessions' do
        before do
            admin_a = FactoryBot.create(:admin, name: 'テスト　管理者A', email: 'a@example.com')
            admin_b = FactoryBot.create(:admin, name: 'テスト　管理者B', email: 'b@example.com')
            admin_c = FactoryBot.create(:admin, name: 'テスト　管理者C', email: 'c@example.com')
            visit new_admin_session_path
        end
        # context 'enter an valid values' do
        #     before do
        #        visit new_admin_session_path
        #        fill_in 'メールアドレス', with: 'a@example.com'
        #        fill_in 'パスワード', with: 'password'
        #        click_button 'ログイン'
        #     end
        #     it 'Successful login' do

        #     end
        #     it 'Admins are listed' do

        #     end
        # end
        context 'enter an invalid values' do 
            before do
                fill_in 'メールアドレス', with: ''
                fill_in 'パスワード', with: ''
                click_button 'ログイン'
            end
            subject { page }
            it 'gets an flash messages' do
                is_expected.to have_selector('.alert', text: 'メールアドレスかパスワードが違います。')
                is_expected.to have_current_path new_admin_session_path
            end
        end
    end
end