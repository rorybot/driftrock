require('./lib/app')

describe DriftrockInterface do
    let(:all_user_data){ File.read("./spec/userDataDump.rb")}
    let(:all_purchase_data){ File.read("./spec/dataDump.rb")}
    let(:driftrock_interface){ DriftrockInterface.new("./spec/dataDump.rb", "./spec/userDataDump.rb")}

  it 'returns the most sold item' do
    expect(driftrock_interface.most_sold).to eq "Gorgeous Granite Computer"
  end

  it 'INTERFACE: returns the most sold item' do
    io = StringIO.new("most_sold")
    expect{driftrock_interface.begin_input(io)}.to output("Gorgeous Granite Computer").to_stdout
  end

  it 'returns the total spend of user with email address' do
    expect(driftrock_interface.total_spend("flatley.murray@bernier.biz")).to eq 274
  end

  it 'INTERFACE: returns the total spend of user with email address' do
    io = StringIO.new("total_spend flatley.murray@bernier.biz")
    expect{driftrock_interface.begin_input(io)}.to output("£274").to_stdout
  end

  it 'returns the most loyal email address' do
    expect(driftrock_interface.most_loyal).to eq "flatley.murray@bernier.biz"
  end

  it 'INTERFACE: returns the most loyal email address' do
    io = StringIO.new("most_loyal")
    expect{driftrock_interface.begin_input(io)}.to output("flatley.murray@bernier.biz").to_stdout
  end

end
