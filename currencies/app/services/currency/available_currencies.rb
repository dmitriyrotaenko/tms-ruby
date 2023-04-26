# frozen_string_literal: true

module Currency
  class AvailableCurrencies < ApplicationService
    API_URL = 'https://www.freeforexapi.com'
    API_PATH = '/api/live'

    def call
      available_currencies = FieldExtractor.call({
        obj: HttpFetcher.call(API_URL + API_PATH),
        field: 'supportedPairs'
      })

      remove_duplicates(available_currencies)
    end

    private

    def remove_duplicates(pairs)
      pairs.map { |pair| [pair[0..2], pair[3..]] }
           .flat_map { |from, to| [from, to] }
           .uniq
           .sort
    end
  end
end
