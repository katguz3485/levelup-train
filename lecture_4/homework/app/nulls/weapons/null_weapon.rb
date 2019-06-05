# frozen_string_literal: true

module Weapons
  class NullWeapon
    def type
      'Undefined weapon type'
    end

    def range
      nil
    end

    def damage
      nil
    end
  end
end
