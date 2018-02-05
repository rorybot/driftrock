require('./lib/app')

describe DriftrockInterface do
    let(:all_user_data){ File.read("./spec/userDataDump.rb")}
    let(:all_purchase_data){ File.read("./spec/dataDump.rb")}

  it 'returns the most sold item' do
    driftrockInterface = DriftrockInterface.new("./spec/dataDump.rb")
    expect(driftrockInterface.most_sold).to eq "Gorgeous Granite Computer"
  end

  it 'returns the total spend of user with email address' do
    driftrockInterface = DriftrockInterface.new("./spec/dataDump.rb", "./spec/userDataDump.rb")
    expect(driftrockInterface.total_spend("flatley.murray@bernier.biz")).to eq 212

  end

  it 'returns the most loyal email address' do
    driftrockInterface = DriftrockInterface.new("./spec/dataDump.rb", "./spec/userDataDump.rb")
    expect(driftrockInterface.most_loyal).to eq "flatley.murray@bernier.biz"
  end
end
