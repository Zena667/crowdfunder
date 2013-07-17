# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Zena"
    last_name "Bielewicz"
    sequence(:email) {|n| "zena#{n}@gmail.com"}
    password: "123"
  end
end
