FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'bob'
    last_name 'smith'
    phone '9499231222'
  end

  factory :second_user, class: 'User' do
    email 'luneth@example.com'
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'luneth'
    last_name 'ur'
    phone '9499231222'
  end

  factory :admin_user, class: 'AdminUser' do
    email 'admin@user.com'
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'admin'
    last_name 'user'
    phone '9499231222'
  end

  factory :non_authorized_user, class: 'User' do
    email 'gilg@example.com'
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'gilg'
    last_name 'god'
    phone '9499231222'
  end
end
