require('./lib/dataAnalyser')
describe DataAnalyser do
    let(:dataAnalyser){DataAnalyser.new}

      it 'produces a frequency table of items purchased' do
        all_purchase_data = File.read("./spec/dataDump.rb")
        all_purchase_data_eval = Kernel.eval(all_purchase_data).flatten
        freq_table = Kernel.eval(File.read("./spec/freqTable"))
        p all_purchase_data_eval
        expect(dataAnalyser.most_sold(all_purchase_data_eval)).to eq freq_table
      end

end
