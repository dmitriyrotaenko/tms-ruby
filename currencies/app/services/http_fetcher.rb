class HttpFetcher < ApplicationService
  OK = 200
  PAIR_NOT_SUPPORTED = 1002

  def call(url)
    # What can I handle here?
    response = JSON(HTTP.get(url))
    status_code = response['code']

    begin
      rate = response&.[]('rates')
      raise Errors::NoRateError if status_code == OK && rate.nil?
      raise Errors::UnsupportedPair if status_code == PAIR_NOT_SUPPORTED

      { data: response }

    rescue 
      
      { error_msg: 'Error' }
    # rescue Errors::UnsupportedPair => e
    #   e.message
    # rescue 
    #   's'
    end
  end
end
