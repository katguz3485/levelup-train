# frozen_string_literal: true

class Weapon < ApplicationRecord
  belongs_to :warrior

  enum kind: %i[magical melee ranged]

  validates :kind, inclusion: { in: Weapon.kinds.keys }
end
