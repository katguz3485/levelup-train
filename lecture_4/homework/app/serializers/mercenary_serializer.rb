# frozen_string_literal: true

class MercenarySerializer < ApplicationSerializer
  attributes :name, :experience, :preferred_weapon_kind, :available_from, :price
  belongs_to :warrior, optional: true
end
