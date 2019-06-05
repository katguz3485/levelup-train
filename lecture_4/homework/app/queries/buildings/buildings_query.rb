# frozen_string_literal: true

module Buildings
  class BuildingsQuery
    def self.find_building(id, relation: Building)
      relation.find(id) unless id.nil?
    end
  end
end
