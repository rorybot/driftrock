class APIConnector
  def purchase_response(page, parse = false)
    uri = 'driftrock-dev-test.herokuapp.com'
    paramsPurchases = '/purchases?per_page=100&page='+page.to_s
    response = Net::HTTP.get(uri, paramsPurchases)
    return JSON.parse(response)["data"] if parse == 'parse'
    return response
  end

  def dataDump
    pageNumber = 1
    purchases_collection = []

    loop do

    purchases_collection << purchase_response(pageNumber, 'parse')
    pageNumber += 1
    p purchases_collection.flatten.count

    if purchase_response(pageNumber, 'parse').empty?
      return purchases_collection.flatten
    break
    end

    end

  end

end
