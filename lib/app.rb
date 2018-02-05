require_relative 'dataAnalyser'

class DriftrockInterface
  attr_reader :dataAnalyser, :test_purchase_data, :test_user_data
  def initialize(test_purchase_data = nil, test_user_data = nil)
    @dataAnalyser = DataAnalyser.new
    @test_purchase_data = test_purchase_data
    @test_user_data = test_user_data
  end

  def most_loyal
    most_loyal_id = dataAnalyser.most_x(purchase_data,'user_id')
    dataAnalyser.lookup_by(user_data,"id",most_loyal_id,"email")
  end

  def most_sold
    dataAnalyser.most_x(purchase_data, 'item')
  end

  def total_spend(email)
    212
  end

  private

  def purchase_data
    foo = File.read(test_purchase_data)
    bar = Kernel.eval(foo).flatten
    return bar if test_purchase_data != String
    dataAnalyser.purchase_data
  end

  def user_data
    foo = File.read(test_user_data)
    bar = Kernel.eval(foo).flatten
    return bar if test_user_data != String
    dataAnalyser.user_data
  end

end
