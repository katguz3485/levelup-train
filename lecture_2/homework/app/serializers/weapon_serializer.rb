# frozen_string_literal: true

class WeaponSerializer < ApplicationSerializer
  attributes :range, :damage, :name, :kind
  belongs_to :warrior
end
