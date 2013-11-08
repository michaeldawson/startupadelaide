# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_configuration do
    key "MyString"
    value "MyText"
    form_type "MyString"
    form_collection_command "MyString"
  end
end
