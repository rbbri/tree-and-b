# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { '1' }
    location { 'Here' }
    likes { [] }
    dislikes { [] }
    radius { nil }
  end

  factory :tree do
    name { 'test_tree' }
    id { '1' }
    description { 'an_example_description' }
    imageURL { 'https://goo.gl/cLZHjA' }
    location { 'there' }
  end
end
