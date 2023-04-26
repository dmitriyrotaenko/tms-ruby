# frozen_string_literal: true
module Currency
  class Rate < ApplicationService
    class NoRateError < StandardError; end
    class UnsupportedPair < StandardError; end

    API_URL = 'https://www.freeforexapi.com/api/live'
    API_QUERY = '?pairs='
    UPDATE_THRESHOLD = 1.hour.ago
    OK = 200
    NO_RATE = 404
    PAIR_NOT_SUPPORTED = 1002
    STATUS_FIELD = 'code'
    DATA_FIELD = 'rates'

    def call(from, to)
      db_record = Conversion.where(from: from, to: to).last
      if db_record && rate_up_to_date?(db_record)
        { code: OK, data: db_record[:rate] }
      else
        begin
          rate = rate_from_api(from, to)
          Conversion.create(from: from, to: to, rate: rate)
        rescue NoRateError => e
          return { code: NO_RATE, data: nil, err_msg: e }
        rescue UnsupportedPair => e
          return { code: PAIR_NOT_SUPPORTED, data: nil, err_msg: e }
        end
        { code: OK, data: rate }
      end
    end

    private

    def rate_up_to_date?(record)
      record.updated_at > UPDATE_THRESHOLD
    end

    def rate_from_api(from, to)
      pair_from_api = HttpFetcher.call(build_url(from, to))
      if pair_from_api[STATUS_FIELD] == OK && pair_from_api[DATA_FIELD].nil?
        raise NoRateError, "There's no rate for the specified currency pair."
      elsif pair_from_api[STATUS_FIELD] == PAIR_NOT_SUPPORTED
        raise UnsupportedPair, 'Pair is not supported'
      end

      FieldExtractor.call({ obj: pair_from_api, field: 'rate' })
    end

    def build_url(from, to)
      [API_URL, API_QUERY, from, to].join
    end
  end
end