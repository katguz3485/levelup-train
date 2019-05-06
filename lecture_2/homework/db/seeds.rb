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


Clan.all.each do |clan|
  Samurai.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                  join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id, defensible_type: defensible_type_list.sample, defensible_id: rand(1..3))
  Hussar.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                 join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id, defensible_type: defensible_type_list.sample, defensible_id: rand(1..3))
  Archer.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                 join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id, defensible_type: defensible_type_list.sample, defensible_id: rand(1..3))
  Artilery.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                   join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id, defensible_type: defensible_type_list.sample, defensible_id: rand(1..3))
end

Rails.logger.info "#{Warriors.all.count} warriors have been created"



