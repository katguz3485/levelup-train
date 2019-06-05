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

Clan.all.each do |clan|
  Samurai.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                  join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id,
                  defensible_type: defensible_type_list.sample, defensible_id: rand(1..3))

  Hussar.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                 join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id,
                 defensible_type: defensible_type_list.sample, defensible_id: rand(1..3))

  Archer.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                 join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id,
                 defensible_type: defensible_type_list.sample, defensible_id: rand(1..3))

  Artilery.create!(name: Faker::Name.name, armor_quality: rand(1..100), number_of_battles: rand(1..10),
                   join_date: Faker::Date.between(100.days.ago, Date.today), clan_id: clan.id,
                   defensible_type: defensible_type_list.sample, defensible_id: rand(1..3))
end


=begin
offensible_type_list = %w[MagicalWeapon MeleeWeapon RangedWeapon]
weapon_name_list = %w[Gun Bow Sword Axe Mortar]

Warrior.all.each do |warrior|
  Weapon.create!(name: weapon_name_list.sample, damage: rand(1..5), range: rand(1..8),
                 offensible_type: offensible_type_list.sample, offensible_id: rand(1..5), warrior_id: warrior.id)
end
=end

Rails.logger.info "Offensibles have been created"
# @chemical.build_safety_precaution(safety_precaution_params)


# create_table "warriors", force: :cascade do |t|
#     t.string "name", null: false
#     t.integer "armor_quality", default: 0
#     t.integer "number_of_battles", default: 0
#     t.date "join_date"
#     t.date "death_date"
#     t.bigint "clan_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "type", default: "Samurai", null: false
#     t.string "defensible_type"
#     t.bigint "defensible_id"
#     t.index ["clan_id"], name: "index_warriors_on_clan_id"
#     t.index ["defensible_type", "defensible_id"], name: "index_warriors_on_defensible_type_and_defensible_id"
#   end
#
#   create_table "weapons", force: :cascade do |t|
#     t.integer "range", default: 0, null: false
#     t.integer "damage", default: 0, null: false
#     t.string "name", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "offensible_type"
#     t.bigint "offensible_id"
#     t.index ["offensible_type", "offensible_id"], name: "index_weapons_on_offensible_type_and_offensible_id"
#   end




