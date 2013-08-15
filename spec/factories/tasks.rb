# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    sequence(:name) { |seq| "Task-#{seq}" }

    project
  end
end
