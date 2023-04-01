# How to initialize inside a module?
class CurrencyFetcher < HttpFetcher
  def call(url)
    super(url)['supportedPairs']
  end
end
