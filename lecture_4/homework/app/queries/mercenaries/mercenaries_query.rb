# frozen_string_literal: true

module Mercenaries
  class MercenariesQuery
    def self.available(relation: Mercenary)
      relation.where(warrior_id: nil).where('available_from < ?', Time.now).first
    end

    def self.cheapest_mercenary(relation: Mercenary)
      relation.where(warrior_id: nil).where('available_from < ?', Time.now).order(price: :asc).first
    end
  end
end
