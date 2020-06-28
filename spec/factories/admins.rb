FactoryBot.define do
    factory :admin do
        name { 'テスト　管理者' }
        email { 'admin@example.com' }
        password { 'password' }
    end
end