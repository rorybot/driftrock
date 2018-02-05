require('./lib/dataAnalyser')
describe DataAnalyser do
    let(:dataAnalyser){DataAnalyser.new}

      it 'produces a frequency table of items purchased, returning most sold' do
        # all_purchase_data = File.read("./spec/dataDump.rb")
        # all_purchase_data_eval = Kernel.eval(all_purchase_data).flatten
        expect(dataAnalyser.most_x(dataAnalyser.purchase_data, 'item')).to eq "Gorgeous Granite Computer"
      end

      it 'produces a frequency table of users, returning most loyal' do
        # all_user_data = File.read("./spec/dataDump.rb")
        # all_purchase_data_eval = Kernel.eval(all_purchase_data).flatten
        expect(dataAnalyser.most_x(dataAnalyser.user_data, 'email')).to eq ""
      end

end
