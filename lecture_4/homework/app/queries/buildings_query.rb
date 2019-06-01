# frozen_string_literal: true

class BuildingsQuery
  def self.find_building(id, relation: Building)
    relation.find(id) unless id.nil?
  end
end
