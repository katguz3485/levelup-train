# frozen_string_literal: true

class WeaponCreator
  attr_reader :mercenary

  def initialize(mercenary:)
    @mercenary = mercenary
  end

  def call
    create_good_weapon
  end

  def create_good_weapon
    case mercenary.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      NullWeapon.new
    end
  end
end
