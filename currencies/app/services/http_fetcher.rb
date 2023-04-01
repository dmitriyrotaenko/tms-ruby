class HttpFetcher < ApplicationService
  def call(url)
    JSON(HTTP.get(url))
  end
end