# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email
    password "12345678"
    password_confirmation "12345678"
    factory :admin do
      after(:build) { |u| u.add_role "admin" }
    end
  end
end
