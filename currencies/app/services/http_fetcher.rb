# frozen_string_literal: true
class HttpFetcher < ApplicationService
  def call(url)
    JSON(HTTP.get(url))
  end
end
