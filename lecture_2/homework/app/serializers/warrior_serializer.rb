# frozen_string_literal: true

class WarriorSerializer < ApplicationSerializer
  # WARRIORS_FEATURES = %i[name shield_quality number_of_battles join_date death_date type].freeze
  attributes :name, :armor_quality, :number_of_battles, :join_date, :death_date, :type
  belongs_to :clan
  belongs_to :defensible

  has_one :weapon
end
