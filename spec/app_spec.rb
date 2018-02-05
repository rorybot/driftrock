require('./lib/app')

def simulate_stdin(*inputs, &block)
   io = StringIO.new
   inputs.flatten.each { |str| io.puts(str) }
   io.rewind

   actual_stdin, $stdin = $stdin, io
   yield
 ensure
   $stdin = actual_stdin
 end

describe DriftrockInterface do
    let(:all_user_data){ File.read("./spec/userDataDump.rb")}
    let(:all_purchase_data){ File.read("./spec/dataDump.rb")}

  it 'returns the most sold item' do
    driftrock_interface = DriftrockInterface.new("./spec/dataDump.rb")
    expect(driftrock_interface.most_sold).to eq "Gorgeous Granite Computer"
  end

  it 'returns the total spend of user with email address' do
    driftrock_interface = DriftrockInterface.new("./spec/dataDump.rb", "./spec/userDataDump.rb")
    expect(driftrock_interface.total_spend("flatley.murray@bernier.biz")).to eq 274

  end

  it 'returns the most loyal email address' do
    driftrock_interface = DriftrockInterface.new("./spec/dataDump.rb", "./spec/userDataDump.rb")
    expect(driftrock_interface.most_loyal).to eq "flatley.murray@bernier.biz"
  end

end
