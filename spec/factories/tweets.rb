# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    text "MyString"
    user_screen_name "MyString"
  end
end
