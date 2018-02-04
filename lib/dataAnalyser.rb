require_relative('APIConnector')

class DataAnalyser
  def initialize(apiConnector = APIConnector.new)
    @apiConnector = apiConnector
  end

  def purchase_data
    @purchase_data ||= @apiConnector.dataDump('/purchases')
  end

  def user_data
    @user_data ||= @apiConnector.dataDump('/users')
  end

  def most_sold(data_for_analysis)
    item_array = data_for_analysis.map { |purchase| purchase['item'] }
    freq_table = item_array.each_with_object(Hash.new(0)) { |v, h| h[v] += 1; }
    item_array.max_by { |v| freq_table[v] }
  end


end
