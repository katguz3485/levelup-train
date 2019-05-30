class ClansQuery

  def self.warriors_class_select(clan:, relation: Clan)
    clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
  end


#   warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
end