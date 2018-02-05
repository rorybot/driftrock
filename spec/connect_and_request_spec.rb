require('./lib/APIConnector')

describe APIConnector do
  let(:apiConnector) { APIConnector.new }

  it 'connects to a URI and grabs the first page of purchase data' do
    expect(apiConnector.purchase_response(1)).to eq File.read('purchasesPage1.json')
  end

  it 'parses information received from URI' do
    purchasesPage1Item1 = { 'user_id' => '2K7H-A8SQ-6R5V-8OT5', 'item' => 'Enormous Linen Plate', 'spend' => '87.16' }
    expect(apiConnector.purchase_response(1, 'parse')[0]).to eq purchasesPage1Item1
  end

  it 'scans each page, storing complete, parsed, flattened collection' do
    #Any way to do without downloading all data first?
    dataDumpFile = File.read('./spec/dataDump.rb')
    expect(apiConnector.data_dump('/purchases')).to eq Kernel.eval(dataDumpFile).flatten
  end
end
