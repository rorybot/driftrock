require('./lib/app')

describe DriftrockInterface do
    let(:all_user_data){ File.read("./spec/userDataDump.rb")}
    let(:all_purchase_data){ File.read("./spec/dataDump.rb")}

  # it 'returns the most sold item' do
  #   expect(driftrockInterface.most_sold).to eq "Gorgeous Granite Computer"
  # end
  #
  # it 'returns the total spend' do
  #
  # end

  it 'returns the most loyal email address' do
    driftrockInterface = DriftrockInterface.new("./spec/dataDump.rb", "./spec/userDataDump.rb")
    expect(driftrockInterface.most_loyal).to eq "flatley.murray@bernier.biz"
  end
end
