# frozen_string_literal: true
module Currency
  class Rate < ApplicationService
    class NoRateError < StandardError; end
    class UnsupportedPair < StandardError; end

    API_URL = 'https://www.freeforexapi.com'
    API_PATH = '/api/live'
    API_QUERY = '?pairs='
    UPDATE_TRESHOLD = 1
    OK = 200
    PAIR_NOT_SUPPORTED = 1002
    STATUS_FIELD = 'code'
    DATA_FIELD = 'rates'

    def call(params)
      from = params[:from]
      to = params[:to]
      db_record = Conversion.find_by(from: from, to: to)
      if db_record && rate_up_to_date?(db_record)
        db_record[:rate]
      else
        begin
          rate = rate_from_api(from, to)
          Conversion.create(from: from, to: to, rate: rate)
        rescue NoRateError, UnsupportedPair => e
          e
        end
        rate
      end
    end

    private

    def rate_up_to_date?(record)
      record.updated_at > UPDATE_TRESHOLD.hour.ago
    end

    def rate_from_api(from, to)
      pair_from_api = HttpFetcher.call(build_url(from, to))
      if pair_from_api[STATUS_FIELD] == OK && pair_from_api[DATA_FIELD].nil?
        raise NoRateError, "There's no rate for the specified currency pair."
      elsif pair_from_api[STATUS_FIELD] == PAIR_NOT_SUPPORTED
        raise UnsupportedPair, 'Unsupported pair'
      end

      FieldExtractor.call({ obj: pair_from_api, field: 'rate' })
    end

    def build_url(from, to)
      [API_URL, API_PATH, API_QUERY, from, to].join
    end
  end
end