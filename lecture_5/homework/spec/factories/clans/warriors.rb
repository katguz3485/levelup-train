# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :warrior, class: 'Warrior' do
    armor_quality { 1 }
    number_of_battles { 20 }
    join_date { Date.today - rand(10) }
    preferred_weapon_kind { 'melee' }
    clan
    building
  end

  factory :samurai, parent: :warrior, class: 'Warriors::Samurai' do
    name { Faker::Name.name }
    type { 'Warriors::Samurai' }
  end

  factory :hussar, parent: :warrior, class: 'Warriors::Hussar' do
    name { Faker::Name.name }
    type { 'Warriors::Hussar' }
  end
end
