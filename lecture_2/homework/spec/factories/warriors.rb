FactoryBot.define do
  factory :warrior do
    name { "MyString" }
    armor_quality { 1 }
    number_of_battles { 1 }
    clan
  end
end
