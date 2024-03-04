FactoryBot.define do
  factory :user do
    name {'test user'}
    email {'user1@test.org'}
    password {'user_pass'}
    password_confirmation {'user_pass'}
  end

  factory :admin_user, class: User do
    name {'test admin_user'}
    email {'admin_user@test.org'}
    password{'admin_user_pass'}
    password_confirmation {'admin_user_pass'}
  end
end