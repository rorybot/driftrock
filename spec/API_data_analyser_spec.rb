require('./lib/dataAnalyser')
describe DataAnalyser do
    let(:dataAnalyser){DataAnalyser.new}

      it 'produces a frequency table of items purchased' do
        expect(dataAnalyser.most_sold).to eq "Gorgeous Granite Computer"
      end

end
