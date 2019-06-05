# frozen_string_literal: true

class RangedWeapon < Weapon
  attribute :kind, :integer, default: Weapon.kind[:ranged]

  def calculate_damage(distance)
    return 0 if distance > range

    damage * (1 - distance / range)
  end
end
