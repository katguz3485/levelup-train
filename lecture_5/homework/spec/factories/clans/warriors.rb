# frozen_string_literal: true

FactoryBot.define do
  factory :warrior, class: 'Warrior' do
    name { 'MyString' }
    experience { 1 }
    preferred_weapon_kind { 'MyString' }
    available_form { '2019-06-06 11:05:20' }
    price { 1 }
    warrior
  end
end
