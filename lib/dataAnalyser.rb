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

  def most_x(data_for_analysis, criteria_for_analysis)
    criteria_array = data_for_analysis.map { |entry| entry[criteria_for_analysis] }
    freq_table = criteria_array.each_with_object(Hash.new(0)) { |v, h| h[v] += 1; }
    criteria_array.max_by { |v| freq_table[v] }
  end

  def lookup_by_id(data, search_criteria_type, id, desired_attribute)
     desired_entry = data.find{|entry| entry[search_criteria_type] == id }
     desired_entry[desired_attribute]
  end

  def all_purchases(data, id)
    p data
    data.select{|entry| entry["user_id"] == id}
  end


end
