class CurrenciesController < ApplicationController
  BASE_URL = 'https://www.freeforexapi.com/api/live'

  def index
    render json: separate_pairs(CurrencyFetcher.call(BASE_URL))
  end

  private

  def separate_pairs(pairs)
    pairs.map { |pair| [pair[0..2], pair[3..]] }
         .flat_map { |from, to| [from, to] }
         .uniq
         .sort
  end
end
