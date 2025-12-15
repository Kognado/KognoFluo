# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { Time.now }

    after(:build) do |user|
      user.profile ||= build(:profile, user: user)
    end
  end
end
