class CurrenciesController < ApplicationController
  API_URL = 'https://www.freeforexapi.com'.freeze
  API_PATH = '/api/live'.freeze
  API_QUERY = '?pairs='.freeze

  def index
    render json: separate_pairs(CurrencyFetcher.call(API_URL + API_PATH))
  end

  # How to show implicitly that this method can accept params?
  def convert
    render json: Converter.call({
      from: params[:from],
      to: params[:to],
      amount: params[:amount],
      full_url: full_url
    })
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
