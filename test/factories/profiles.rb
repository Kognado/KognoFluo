# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user { nil }
    first_name { 'John' }
    last_name { 'Doe' }
    birth_date { '1990-01-01' }
    gender { 1 }
    avatar { nil }
  end
end
