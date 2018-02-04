describe APIConnector do
  it 'connects to a URI and grabs the first page of purchase data' do
    apiConnector = new APIConnector
    expect(apiConnector.purchase_response(1)).to eq File.read("purchaes.json")
  end
end
