# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category, :class => 'Category' do
    name "Internet"
    parent_id 0
    description "MyText"
  end
end
