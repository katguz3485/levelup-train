# frozen_string_literal: true

module Warriors
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
      warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
      create_good_weapon(mercenary)
      warrior
    end

    def clan
      Clans::ClansQuery.find_by_id(params[:clan_id])
    end

    def building
      Buildings::BuildingsQuery.find_building(params[:building_id])
    end

    def warrior_class
      Clans::ClansQuery.warriors_class_select(clan: clan, relation: Clan)
    end

    def create_good_weapon(mercenary)
      Weapons::WeaponCreator.new(mercenary: mercenary).call
    end
  end
end
