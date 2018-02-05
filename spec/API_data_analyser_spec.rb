require('./lib/dataAnalyser')
describe DataAnalyser do
    let(:dataAnalyser){DataAnalyser.new}

      it 'produces a frequency table of items purchased, returning most sold' do
        expect(dataAnalyser.most_x(dataAnalyser.purchase_data, 'item')).to eq "Gorgeous Granite Computer"
      end

      it 'produces a frequency table of users, returning most loyal' do
        expect(dataAnalyser.most_x(dataAnalyser.purchase_data, 'user_id')).to eq "RPIZ-UHP7-CR8J-8A08"
      end

      it 'can find an email address by id' do
        all_user_data = File.read("./spec/userDataDump.rb")
        all_user_data_eval = Kernel.eval(all_user_data).flatten
        expect(dataAnalyser.lookup_by_id(all_user_data_eval, "id", "RPIZ-UHP7-CR8J-8A08", "email")).to eq 'flatley.murray@bernier.biz'
      end

      it 'can produce a collection of all purchases by id and sum' do
        all_purchase_data = File.read("./spec/dataDump.rb")
        all_purchase_data_eval = Kernel.eval(all_purchase_data).flatten
        expect(dataAnalyser.sum_all_purchases(all_purchase_data_eval,"RPIZ-UHP7-CR8J-8A08")).to eq 274
      end

end
