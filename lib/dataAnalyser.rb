require_relative('APIConnector')

class DataAnalyser
  def initialize(apiConnector = APIConnector.new)
    @purchase_data = apiConnector.dataDump
  end

  def most_sold(purchase_data = @purchase_data)
    item_array = purchase_data.map { |purchase| purchase['item'] }
    freq_table = item_array.each_with_object(Hash.new(0)) { |v, h| h[v] += 1; }
    item_array.max_by { |v| freq_table[v] }
  end
end
