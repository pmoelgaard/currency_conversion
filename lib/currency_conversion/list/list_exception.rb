module CurrencyLayer

  class ListException < Exception

    attr_accessor :error

    def initialize(error)
      self.error = error
    end

  end

end
