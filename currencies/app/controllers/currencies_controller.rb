class CurrenciesController < ApplicationController
  API_URL = 'https://www.freeforexapi.com'.freeze
  API_PATH = '/api/live'.freeze
  API_QUERY = '?pairs='.freeze

  UPDATE_RATE_AFTER_HOUR = 1

  def index
    render json: separate_pairs(
      HttpFetcher.call(API_URL + API_PATH)[:data]['supportedPairs']
    )
  end

  # How to show implicitly that this method can accept params?
  def convert
    from = params[:from]
    to = params[:to]
    conv_manager = Currency::ConversionManager.new
    rate = conv_manager.find({ from: from, to: to })&.[](:rate)
    
    if rate.nil?
      api_request = HttpFetcher.call(full_url + from + to)
      if api_request.key?(:data)
        rate = api_request[:data]['rates'][from + to]['rate']
        conv_manager.add({ from: from, to: to, rate: rate })
      end
    end
    render json: Currency::Converter.call({ amount: params[:amount], rate: rate })
  end

  private
  
  def separate_pairs(pairs)
    pairs.map { |pair| [pair[0..2], pair[3..]] }
         .flat_map { |from, to| [from, to] }
         .uniq
         .sort
  end

  def full_url
    API_URL + API_PATH + API_QUERY
  end
end
