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
    # File.write('userDataDump', @user_data)
  end

  def most_x(data_for_analysis, criteria_for_analysis)
    criteria_array = data_for_analysis.map { |entry| entry[criteria_for_analysis] }
    freq_table = criteria_array.each_with_object(Hash.new(0)) { |v, h| h[v] += 1; }
    criteria_array.max_by { |v| freq_table[v] }
  end

  def lookup_by_id(data, id, desired_attribute)
     # id_array = data.select { |entry|
     #  p entry[id]}

     desired_entry = data.find{|entry| entry["id"] == id }
     desired_entry[desired_attribute]

    #   id_array.selec
    #
    # id_array.select { |entry|
    # result = entry["id"] == id
    # p result
    #   return result[desired_attribute]
    # }
    #
    # p bar
  end


end
