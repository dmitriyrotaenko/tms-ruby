# How to initialize inside a module?

class CurrencyFetcher
  def self.call(url)
    new.call(url)
  end

  def call(url)
    JSON.parse(HTTP.get(url))['supportedPairs']
  end
end
