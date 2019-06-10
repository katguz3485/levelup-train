# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Clans::Warrior, type: :model do
  describe 'validations' do
    let(:warrior) {create(:warrior)}
    it {should validate_presence_of :name}
    it {should validate_numericality_of(:armor_quality).only_integer}
    it {should validate_numericality_of(:armor_quality).is_greater_than_or_equal_to(0)}
    it {should validate_numericality_of(:armor_quality).is_less_than_or_equal_to(100)}
    it {should validate_presence_of :preferred_weapon_kind}
    it {
      should validate_inclusion_of(:preferred_weapon_kind)
                 .in_array(Weapon::KINDS)
    }

    context 'uniquness of name conditional validation' do
      let!(:warrior_alive) {create(:warrior, death_date: nil, name: Faker::Name.name)}
      it {should validate_uniqueness_of(:name)}
    end
  end

  describe 'associations' do
    it {should belong_to(:building).optional}
    it {should belong_to(:clan).counter_cache}
    it {should have_one(:weapon).dependent(:destroy)}
    it {should have_one :mercenary}
  end

  describe 'database_columns' do
    it {should have_db_column :name}
    it {should have_db_column :join_date}
    it {should have_db_column :death_date}
    it {should have_db_column :clan_id}
    it {should have_db_column :type}
    it {should have_db_column :preferred_weapon_kind}
    it {should have_db_column :building_id}
  end
end
