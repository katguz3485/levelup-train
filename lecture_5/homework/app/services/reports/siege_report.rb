# frozen_string_literal: true

module Reports
  class SiegeReport
    attr_reader :building

    def initialize(building:)
      @building = building
    end

    def call
      if @building.warriors.alive.present?
        siege_ability
        # @building.update!(siege_ability: siege_ability)
      else
        0
      end
    end

    private

    def siege_ability
      granary / consume_ratio
    end

    def granary
      @building.granary
    end

    def infantry_warriors_number
      Buildings::BuildingsQuery.count_infantry_warriors(building: @building)
    end

    def calvary_warriors_number
      Buildings::BuildingsQuery.count_calvary_warriors(building: @building)
    end

    def consume_ratio
      10 + infantry_warriors_number + (2 * calvary_warriors_number)
    end
  end
end
