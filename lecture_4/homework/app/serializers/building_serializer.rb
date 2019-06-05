# frozen_string_literal: true

class BuildingSerializer < ApplicationSerializer
  attributes :name

  has_many :warriors
end
