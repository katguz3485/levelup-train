# frozen_string_literal: true

class ClanSerializer < ApplicationSerializer
  has_many :warriors

  attributes :name
end
