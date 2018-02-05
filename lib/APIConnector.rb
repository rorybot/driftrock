require 'net/http'
require 'JSON'

class APIConnector
  def purchase_response(page, parse = false, route = '/purchases')
    uri = 'driftrock-dev-test.herokuapp.com'
    paramsPurchases = route + '?per_page=100&page=' + page.to_s
    response = Net::HTTP.get(uri, paramsPurchases)
    return JSON.parse(response)['data'] if parse == 'parse'
    response
  end

  def dataDump(data_source)
    pageNumber = 1
    purchases_collection = []

    loop do
      purchases_collection << purchase_response(pageNumber, 'parse', data_source)
      pageNumber += 1
      if purchase_response(pageNumber, 'parse').empty?
        return purchases_collection.flatten
        break
      end
    end
  end
end
