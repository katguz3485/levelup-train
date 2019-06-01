# frozen_string_literal: true

class WarriorRecruiter
  attr_reader :mercenary, :params

  def initialize(mercenary:, params:)
    @mercenary = mercenary
    @params = params
  end

  def call
    employ(mercenary: mercenary)
  end

  private

  def employ(mercenary:)
    clan = clan_finder
    building = building_finder
    warrior_class = warrior_class_selector
    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    create_good_weapon(mercenary)
    warrior
  end

  def clan_finder
    ClansQuery.find_by_id(params[:clan_id])
  end

  def building_finder
    BuildingsQuery.find_building(params[:building_id])
  end

  def warrior_class_selector
    ClansQuery.warriors_class_select(clan: clan_finder, relation: Clan)
  end

  def create_good_weapon(mercenary)
    WeaponCreator.new(mercenary: mercenary).call
  end
end
