FactoryBot.define do
  factory :user do
    id { '1' }
    location { 'Here' }
  end

  factory :tree do
    name { 'test_tree' }
    id { '1'}
    description { 'an_example_description' }
    imageURL { 'https://goo.gl/cLZHjA' }
    location { 'there' }
  end
end
