require('./lib/APIConnector')

describe APIConnector do


    let(:dataAnalyser){DataAnalyser.new}

      it 'produces a frequency table of items purchased' do
        all_purchase_data = File.read("./spec/dataDump.rb")
        all_purchase_data_eval = Kernel.eval(all_purchase_data).flatten
        freq_table = Kernel.eval(File.read("./spec/freqTable"))
        expect(dataAnalyser.mostSold(all_purchases_from_API)).to eq freq_table
      end

end
