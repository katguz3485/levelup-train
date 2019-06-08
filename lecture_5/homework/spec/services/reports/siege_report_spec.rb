RSpec.describe Reports::SiegeReport, type: :service do
  subject(:siege_report) {Reports::SiegeReport.new(building: building)}
  let(:building) {create(:building, granary: granary_value)}
  let(:clan) {create(:clan)}
  let(:granary_value) {15}


  context 'when warriors are absent' do
    describe ".call" do
      it 'should return 0 value of siege ability ' do
        expect(siege_report.call).to eq(0)
      end
    end
  end

  context 'when 1 cavlary is present' do
    describe ".call" do
      let!(:warrior) {build(:samurai)}
      it 'should return 3 value of siege ability' do
        expect(siege_report.call).to eq(3)
      end
    end
  end

  context 'when 1 infantry' do
    describe 'call' do
      let!(:warrior) {build(:hussar)}
      it 'should return 4 value of siege ability' do
        expect(siege_report.call).to eq(4)
      end
    end
  end

  context 'when 1 cavlary and  1 infantry' do
    describe '.call' do
      let!(:warrior) {build(:hussar)}
      let!(:warrior) {build(:samurai)}
      it 'should return 2 value of siege ability' do
        expect(siege_report.call).to eq(2)
      end
    end
  end

end


# module Reports
#   class SiegeReport
#     def initialize(building:); end
#
#     def call
#       raise NotImprementedYet
#     end
#   end
# end