require_relative 'dataAnalyser'

class DriftrockInterface
  attr_reader :dataAnalyser, :test_purchase_data, :test_user_data
  def initialize(test_purchase_data = nil, test_user_data = nil)
    @dataAnalyser = DataAnalyser.new
    @test_purchase_data = test_purchase_data
    @test_user_data = test_user_data
  end

  def begin_input
    if STDIN.gets.chomp.to_s == most_loyal
      most_loyal
    end
  end

  def most_loyal
    most_loyal_id = dataAnalyser.most_x(purchase_data, 'user_id')
    dataAnalyser.lookup_by(user_data, 'id', most_loyal_id, 'email')
  end

  def most_sold
    dataAnalyser.most_x(purchase_data, 'item')
  end

  def total_spend(email)
    id_of_email = dataAnalyser.lookup_by(user_data, 'email', email, 'id')

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
    dataAnalyser.purchase_data
  end

  def user_data
    if test_user_data.class == String
      foo = File.read(test_user_data)
      bar = Kernel.eval(foo).flatten
      return bar
    end
    dataAnalyser.user_data
  end
end
#
# driftrockInterface = DriftrockInterface.new
# driftrockInterface.begin_input
