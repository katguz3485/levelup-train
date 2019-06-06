# frozen_string_literal: true

FactoryBot.define do
  factory :clan do
    sequence(:name) { |n| "clan#{n}name" }
    warriors_count { 1 }
  end
end
