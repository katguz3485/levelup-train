require 'rails_helper'

RSpec.describe Building, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:building) }
    it { should validate_presence_of :granary }
  end

  describe 'associations' do
    it { should have_many(:warriors).dependent(:nullify) }
  end

  describe 'database_columns' do
    it { should have_db_column :name}
    it { should have_db_column :type}
    it { should have_db_column :granary}
    it { should have_db_column :siege_ability}
  end
end
