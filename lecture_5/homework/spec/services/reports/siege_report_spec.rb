# frozen_string_literal: true

RSpec.describe Reports::SiegeReport, type: :service do
  subject(:siege_report) { Reports::SiegeReport.new(building: building) }
  let(:building) { create(:building, granary: granary_value) }
  let(:clan) { create(:clan) }
  let(:granary_value) { 100 }

  context 'when warriors are absent' do
    describe '.call' do
      it 'should return 0 value of siege ability ' do
        expect(siege_report.call).to eq(0)
      end
    end
  end

  context 'when 1 cavlary is present' do
    describe '.call' do
      let!(:warrior) { create(:samurai, building: building, clan: clan) }
      it 'should return 9 value of siege ability' do
        expect(siege_report.call).to eq(9)
      end
    end
  end

  context 'when 1 infantry' do
    describe 'call' do
      let!(:warrior) { create(:hussar, building: building, clan: clan) }
      it 'should return 8 value of siege ability' do
        expect(siege_report.call).to eq(8)
      end
    end
  end

  context 'when 1 cavlary and  1 infantry' do
    describe '.call' do
      let!(:warrior) { create(:hussar, building: building, clan: clan) }
      let!(:warrior2) { create(:samurai, building: building, clan: clan) }
      it 'should return 8 value of siege ability' do
        expect(siege_report.call).to eq(7)
      end
    end
  end
end
