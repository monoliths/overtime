FactoryGirl.define do
  factory :audit_log do
    user 
    status 0
    start_date (Date.today - 1.day)
    end_date nil
  end
end
