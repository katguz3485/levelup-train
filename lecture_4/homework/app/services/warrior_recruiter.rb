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
    clan = find_clan
    building = find_building

    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    create_good_weapon(mercenary)
    warrior
  end

  def create_good_weapon(mercenary)
    WeaponCreator.new(mercenary: mercenary).call
  end

  def warrior_class
    ClansQuery.warriors_class_select(clan: find_clan, relation: Clan)
  end

  def find_building
    Building.find(params[:building_id]) if params[:building_id]
  end

  def find_clan
    if params[:clan_id]
      Clan.find(params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
