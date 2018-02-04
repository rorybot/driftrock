require('./lib/dataAnalyser')
describe DataAnalyser do
    let(:dataAnalyser){DataAnalyser.new}

      it 'produces a frequency table of items purchased' do
        all_purchase_data = File.read("./spec/dataDump.rb")
        all_purchase_data_eval = Kernel.eval(all_purchase_data).flatten
        expect(dataAnalyser.most_sold(all_purchase_data_eval)).to eq "Gorgeous Granite Computer"
      end

end
