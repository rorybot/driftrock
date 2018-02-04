class APIConnector
  def purchase_response(page)
    uri = 'driftrock-dev-test.herokuapp.com'
    paramsPurchases = '/purchases?per_page=100&page='+page.to_s

    response = Net::HTTP.get(uri, paramsPurchases)
  end
end
