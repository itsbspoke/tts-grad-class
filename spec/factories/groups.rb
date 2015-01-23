# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "MyString"
    association :owner, factory: :user
    membership_count 1
  end
  factory :paid_group, class: Group do
    name "MyString"
    association :owner, factory: :user
    free false
  end  
end
