FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'bob'
    last_name 'smith'
  end

  factory :second_user, class: 'User' do
    email 'luneth@example.com'
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'luneth'
    last_name 'ur'
  end

  factory :admin_user, class: 'AdminUser' do
    email 'admin@user.com'
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'admin'
    last_name 'user'
  end
end
