# frozen_string_literal: true

module Clans
  class ClansQuery
    def self.warriors_class_select(clan:, relation: Clan)
      clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
    end

    def self.find_by_id(id, relation: Clan)
      if id.nil?
        relation.order(warriors_count: :desc).first
      else
        relation.find(id)
      end
    end
  end
end