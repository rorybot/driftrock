ENV["DRIFTROCK_TEST_ENV"] ||= 'development'

require_relative 'dataAnalyser'

class DriftrockInterface
  attr_reader :data_analyser, :test_purchase_data, :test_user_data
  def initialize(test_purchase_data = nil, test_user_data = nil)
    @data_analyser = DataAnalyser.new
    @test_purchase_data = test_purchase_data
    @test_user_data = test_user_data
  end

  def begin_input
    store_input = STDIN.gets.chomp.to_s
    if store_input == 'most_loyal'
      print most_loyal.to_s
    elsif store_input == 'most_sold'
      print most_sold.to_s
    elsif store_input.include?('total_spend')
      address_lookup = store_input.split.last
      print '£' + total_spend(address_lookup.to_s).to_s
    elsif store_input == ""
      yield
    elsif store_input == 'quit'
      exit
    end
  end

  def most_loyal
    most_loyal_id = data_analyser.most_x(purchase_data, 'user_id')
    data_analyser.lookup_by(user_data, 'id', most_loyal_id, 'email')
  end

  def most_sold
    data_analyser.most_x(purchase_data, 'item')
  end

  def total_spend(email)
    id_of_email = data_analyser.lookup_by(user_data, 'email', email, 'id')

    all_purchases = purchase_data.select { |entry| entry['user_id'] == id_of_email }

    all_purchases.inject(0) { |sum, x| sum + x['spend'].to_i }
  end

  private

  def purchase_data
    if test_purchase_data.class == String
      foo = File.read(test_purchase_data)
      bar = Kernel.eval(foo).flatten
      return bar
    end
    data_analyser.purchase_data
  end

  def user_data
    if test_user_data.class == String
      foo = File.read(test_user_data)
      bar = Kernel.eval(foo).flatten
      return bar
    end
    data_analyser.user_data
  end
end

driftrockInterface = DriftrockInterface.new
if ENV["DRIFTROCK_TEST_ENV"] == 'development'
  loop do
  driftrockInterface.begin_input
  end
end
