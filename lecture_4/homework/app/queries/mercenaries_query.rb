# frozen_string_literal: true

class MercenariesQuery
  def self.available(relation: Mercenary)
    relation.where(warrior_id: nil).where('available_from < ?', Time.now)
  end

  def self.cheap_and_experienced(relation: Mercenary)
    relation.where(warrior_id: nil).where(experience: :desc, price: :asc)
  end
end
