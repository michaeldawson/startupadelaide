# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do |f|
    f.name "test"
    f.association(:category)
    f.city "test"
    f.contact "test"
    f.street "test"
  end
end
