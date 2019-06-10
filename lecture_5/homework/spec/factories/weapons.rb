# frozen_string_literal: true

FactoryBot.define do
  factory :weapon do
    range { rand(1..10) }
    damage { rand(1..32) }
    kind { 'melee' }
    type { 'Weapons::Katana' }
    warrior
  end

  factory :katana, parent: :weapon, class: 'Katana' do
    kind { 'melee' }
  end

  factory :musket, parent: :musket, class: 'Musket' do
    kind { 'ranged' }
  end
end
