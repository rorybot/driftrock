require('./lib/APIConnector')

describe APIConnector do
  it 'connects to a URI and grabs the first page of purchase data' do
    apiConnector = APIConnector.new
    expect(apiConnector.purchase_response(1)).to eq File.read("purchasesPage1.json")
  end

  it 'parses information received from URI' do
    purchasesPage1Item1 = {"user_id" => "2K7H-A8SQ-6R5V-8OT5","item" => "Enormous Linen Plate","spend" => "87.16" }
    apiConnector = APIConnector.new
    expect(apiConnector.purchase_response(1, 'parse')[0]).to eq purchasesPage1Item1
  end
end
