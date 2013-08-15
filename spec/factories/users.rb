# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |seq| "user-#{seq}@email.com" }
    password "user-password"
  end
end
