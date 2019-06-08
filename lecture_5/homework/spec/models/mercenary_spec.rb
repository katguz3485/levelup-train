require 'rails_helper'

RSpec.describe Mercenary, type: :model do

  describe 'validations' do
    subject {FactoryBot.build(:mercenary)}
    it {should validate_presence_of :name}
    it {should validate_numericality_of(:experience).is_greater_than_or_equal_to(0)}
    it {should validate_numericality_of(:price).is_greater_than_or_equal_to(0)}
    it {should validate_presence_of :available_from}
    it {should validate_inclusion_of(:preferred_weapon_kind).
        in_array(Weapon::KINDS)}
  end

  describe 'associations' do
    it {should belong_to(:warrior).optional}
  end

  describe 'database_columns' do
    it {should have_db_column :name}
    it {should have_db_column :experience}
    it {should have_db_column :preferred_weapon_kind}
    it {should have_db_column :available_from}
    it {should have_db_column :warrior_id}

  end
end


