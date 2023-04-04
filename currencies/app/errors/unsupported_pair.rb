module Errors
  class UnsupportedPair < StandardError
    def initialize(msg = 'The specified currency pair isn\'t supported 😢')
      super
    end
  end
end