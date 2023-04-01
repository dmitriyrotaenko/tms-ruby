class Converter < ApplicationService
  def call(params)
    from = params[:from]
    to = params[:to]
    amount = params[:amount].to_f
    # Handle no params
    url = params[:full_url] + from + to
    # Handle 'no rate error', wrong currency code
    begin
      rate = HttpFetcher.call(url)['rates'][from + to]['rate']
      (amount * rate).round(2)
    rescue NoMethodError
      NoRateError.new.message if rate.nil?
    end
  end
end
