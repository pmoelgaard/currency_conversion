module CurrencyLayer

  class ChangeOptions

    include Hashable

    attr_accessor :access_key

    attr_accessor :start_date
    attr_accessor :end_date
    attr_accessor :currencies

    def initialize()
      @query = nil
    end

  end

end
