FactoryGirl.define do
  factory :post do
    date Date.today
    rationale 'Thug lyfe'
    association :user
  end

  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale 'Derp'
    association :user
  end
end
