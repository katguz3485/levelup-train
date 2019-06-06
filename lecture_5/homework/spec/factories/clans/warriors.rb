# frozen_string_literal: true

FactoryBot.define do
  factory :warrior, class: 'Warriors::Samurai' do
    sequence(:name) { |n| "Warrior_name#{n}" }
    armor_quality { 1 }
    number_of_battles { 20 }
    join_date { Date.today - rand(10) }
    experience { 1 }
    preferred_weapon_kind { 'melee' }
    available_from { '2019-06-06 11:05:20' }
    type { 'Warriors::Samurai' }
    price { 1 }
    clan
  end
end
