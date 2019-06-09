# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weapon, type: :model do
  describe 'validations' do
    let(:weapon) { build(:weapon) }
    KINDS = %w[magical melee ranged].freeze
    it { should validate_numericality_of(:range).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:damage).is_greater_than_or_equal_to(0) }
    it { should validate_inclusion_of(:kind).in_array(KINDS) }
  end

  describe 'custom validations' do
    let(:warrior) { create(:warrior, preferred_weapon_kind: 'ranged', type: 'Warriors::Samurai', name: Faker::Name.name) }
    let(:weapon) { create(:weapon, kind: 'melee', warrior: warrior) }

    it 'validates if weapon can be used' do
      should_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to :warrior }
  end

  describe 'database_columns' do
    it { should have_db_column :damage }
    it { should have_db_column :kind }
    it { should have_db_column :range }
    it { should have_db_column :type }
  end
end
