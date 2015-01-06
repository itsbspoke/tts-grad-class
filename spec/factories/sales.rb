# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale do
    email "MyString"
    guid "MyString"
    product nil
    stripe_id "MyString"
  end
end
