require 'faker'

Rails.logger = Logger.new(STDOUT)
Rails.logger.info "Populating db with seeds started"


clan_list = [{name: "Magic"}, {name: "Wisdom"}, {name: "Strength"}]

clan_list.each do |clan|
  Clan.create(name: clan[:name])
end

Rails.logger.info "#{Clan.all.count} clans have been created"

defensible_type_list = %w[Tower Stronghold Wall]

3.times do
  Tower.create!
  Stronghold.create!
  Wall.create!
end

Rails.logger.info "Defensibles have been created"

offensible_type_list = %w[MagicalWeapon MeleeWeapon RangedWeapon]

3.times do
  MagicalWeapon.create!
  MeleeWeapon.create!
  RangedWeapon.create!
end

warriors_type_list = %w[Samurai Hussar Archer Artilery]


Rails.logger.info "Offensibles have been created"

Clan.all.each do |clan|
  Warrior.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                  join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id,
                  defensible_type: defensible_type_list.sample, defensible_id: rand(1..3),
                  offensible_type: offensible_type_list.sample, offensible_id: rand(1..3), type: warriors_type_list.sample)
end

Rails.logger.info "#{Warriors.all.count} warriors have been created"





