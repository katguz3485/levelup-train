# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Clan, type: :model do
  subject(:clan) { build(:clan) }
  it 'is valid' do
    expect(clan).to be_valid
  end

  context 'without name' do
    before { clan.name = nil }
    it 'is not valid' do
      expect(clan).to be_invalid
    end
  end
end
