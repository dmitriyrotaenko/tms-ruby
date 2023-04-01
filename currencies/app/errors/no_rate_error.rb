class NoRateError < StandardError
  def initialize(msg = 'There\'s no rate information for the specified currency pair.')
    super
  end
end
