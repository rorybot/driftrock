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

  def lookup_by(data, search_criteria_type, search_criteria, desired_attribute)
     desired_entry = data.find{|entry| entry[search_criteria_type] == search_criteria }
     desired_entry[desired_attribute]
  end

  def sum_all_purchases(data, id)
    all_purchases = data.select{|entry| entry["user_id"] == id}
    return all_purchases.inject(0){ |sum,x| sum + x["spend"].to_i}
  end

  def total_spend_by(email)
    id_of_email = lookup_by(user_data, "email", email, "id")
    sum_all_purchases(purchase_data, id_of_email)
  end

  def most_loyal
    most_loyal_id = most_x(purchase_data,'user_id')
    lookup_by(user_data,"id",most_loyal_id,"email")
  end


end
