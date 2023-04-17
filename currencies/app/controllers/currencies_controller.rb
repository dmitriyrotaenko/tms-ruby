# frozen_string_literal: true

class CurrenciesController < ApplicationController
  API_URL = 'https://www.freeforexapi.com'
  API_PATH = '/api/live'

  def index
    currencies_request = HttpFetcher.call(API_URL + API_PATH)
    render json: remove_duplicates(
      FieldExtractor.call({ obj: currencies_request, field: 'supportedPairs' })
    )
  end

  def convert
    render json: Currency::Converter.call({
      amount: params[:amount],
      rate: Currency::Rate.call({ from: params[:from], to: params[:to] })
    })
  end

  private

  def remove_duplicates(pairs)
    pairs.map { |pair| [pair[0..2], pair[3..]] }
         .flat_map { |from, to| [from, to] }
         .uniq
         .sort
  end
end
