FactoryGirl.define do
  factory :post do
    date Date.today
    rationale 'Thug lyfe'
    overtime_request 2.5
    association :user, factory: :user
  end

  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale 'Derp'
    overtime_request 0.5
    association :user, factory: :user
  end

  factory :post_from_other_user do
    date Date.today
    rationale 'another users post'
    overtime_request 3.5
    association :user, factory: :user
  end

end
