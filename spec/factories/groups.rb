# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "MyString"
    association :owner, factory: :user
    membership_count 1
  end
end
