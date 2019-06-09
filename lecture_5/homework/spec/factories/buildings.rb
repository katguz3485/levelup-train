# frozen_string_literal: true

FactoryBot.define do
  factory :building do
    name { 'Castle' }
    type { 'Buildings::Stronghold' }
    granary { 1 }
  end
end
