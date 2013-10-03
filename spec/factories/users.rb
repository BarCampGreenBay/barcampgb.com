# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    twitter "MyString"
    shirt_size "MyString"
    diet_concerns "MyText"
  end
end
