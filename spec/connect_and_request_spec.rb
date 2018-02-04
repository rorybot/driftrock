require('./lib/APIConnector')

describe APIConnector do

  let(:apiConnector){APIConnector.new}

  it 'connects to a URI and grabs the first page of purchase data' do

    expect(apiConnector.purchase_response(1)).to eq File.read("purchasesPage1.json")
  end

  it 'parses information received from URI' do
    purchasesPage1Item1 = {"user_id" => "2K7H-A8SQ-6R5V-8OT5","item" => "Enormous Linen Plate","spend" => "87.16" }
    expect(apiConnector.purchase_response(1, 'parse')[0]).to eq purchasesPage1Item1
  end

  it 'scans each page, storing complete, parsed, flattened collection' do
    #Is this best? Would we have to download an entire database to iterate over it? Could we examine JSON actively?

    #Maybe if frequency table, items are added to it if not already there, or else they are increased by one

    #Would be two step method: grab 1st page, and then a slightly different one for each subsequent page

    dataDumpFile = File.read("./spec/dataDump.rb")
    expect(apiConnector.dataDump).to eq Kernel.eval(dataDumpFile).flatten

  end
end
