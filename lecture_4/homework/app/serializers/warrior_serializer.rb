# frozen_string_literal: true

class WarriorSerializer < ApplicationSerializer
  attributes :name, :armor_quality, :number_of_battles, :join_date, :death_date,
             :preferred_weapon_kind

  belongs_to :clan
  belongs_to :building
  has_one :weapon
  has_one :mercenary
end
