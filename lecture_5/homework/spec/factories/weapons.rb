FactoryBot.define do
  factory :weapon do
    range { rand(1..10) }
    damage { rand(1..32) }
    kind { "melee" }
    type { "Weapons::Katana" }
    warrior
  end
end
