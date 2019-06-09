# frozen_string_literal: true

module Buildings
  class BuildingsQuery
    def self.count_infantry_warriors(building:)
      building.warriors.where(type: 'Warriors::Samurai').count
    end

    def self.count_calvary_warriors(building:)
      building.warriors.where(type: 'Warriors::Hussar').count
    end
  end
end
