require('./lib/dataAnalyser')
describe DataAnalyser do
    let(:dataAnalyser){DataAnalyser.new}
    before(:each) do
    all_user_data = File.read("./spec/userDataDump.rb")
    all_purchase_data = File.read("./spec/dataDump.rb")
    allow(dataAnalyser).to receive(:user_data).and_return( Kernel.eval(all_user_data).flatten)
    allow(dataAnalyser).to receive(:purchase_data).and_return(Kernel.eval(all_purchase_data).flatten)
    end


      it 'produces a frequency table of items purchased, returning most sold' do
        expect(dataAnalyser.most_x(dataAnalyser.purchase_data, 'item')).to eq "Gorgeous Granite Computer"
      end

      it 'produces a frequency table of users, returning most loyal ID' do
        expect(dataAnalyser.most_x(dataAnalyser.purchase_data, 'user_id')).to eq "RPIZ-UHP7-CR8J-8A08"
      end

      it 'can find an id by email address' do
        all_user_data = File.read("./spec/userDataDump.rb")
        all_user_data_eval = Kernel.eval(all_user_data).flatten
        expect(dataAnalyser.lookup_by(all_user_data_eval, "email",'flatley.murray@bernier.biz', "id")).to eq "RPIZ-UHP7-CR8J-8A08"
      end


      it 'can produce a collection of all purchases by id and sum' do
        all_purchase_data = File.read("./spec/dataDump.rb")
        all_purchase_data_eval = Kernel.eval(all_purchase_data).flatten
        expect(dataAnalyser.sum_all_purchases(all_purchase_data_eval,"RPIZ-UHP7-CR8J-8A08")).to eq 274
      end

      it 'can lookup email and find sum of all purchases' do
        expect(dataAnalyser.total_spend_by('flatley.murray@bernier.biz')).to eq 274

      end

end
