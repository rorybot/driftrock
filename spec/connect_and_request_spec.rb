require('./lib/APIConnector')

describe APIConnector do
  it 'connects to a URI and grabs the first page of purchase data' do
    apiConnector = APIConnector.new
    expect(apiConnector.purchase_response(1)).to eq File.read("purchasesPage1.json")
  end
end
