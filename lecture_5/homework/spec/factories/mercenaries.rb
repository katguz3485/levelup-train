# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :mercenary do
    name { Faker::Name.name }
    experience { 1 }
    preferred_weapon_kind { 'MyString' }
    available_from { 'MyString' }
    price { 1 }
    warrior
  end
end
