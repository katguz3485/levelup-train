# frozen_string_literal: true

class MagicalWeapon < Weapon
  attribute :kind, :integer, default: Weapon.kind[:magical]

  def calculate_damage(distance)
    return 0 if distance > range

    damage * (1 - distance / range)
  end
end
