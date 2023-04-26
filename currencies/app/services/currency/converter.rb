module Currency
  class Converter < ApplicationService
    def call(amount, from, to)
      rate_request = Currency::Rate.call(from, to)
      rate = rate_request[:data]
      if rate
        {
          code: 200,
          pair: "#{from} -> #{to}",
          amount: amount,
          rate: rate,
          conversion_result: (amount.to_f * rate.to_f).round(2)
        }
      else
        { code: rate_request[:code], err_msg: rate_request[:err_msg] }
      end
    end
  end
end
