# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership_plan do
    amount 1
    interval "MyString"
    stripe_id "MyString"
    name "MyString"
  end
end
