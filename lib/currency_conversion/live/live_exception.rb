module CurrencyLayer

  class LiveException < Exception

    attr_accessor :error

    def initialize(error)
      self.error = error
    end

  end

end
