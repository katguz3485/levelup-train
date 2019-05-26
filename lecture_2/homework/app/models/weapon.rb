# frozen_string_literal: true

class Weapon < ApplicationRecord
  belongs_to :warrior
  belongs_to :offensible, polymorphic: true
end
