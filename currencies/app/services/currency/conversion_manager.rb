module Currency
  class ConversionManager
    def add(params)
      Conversion.create(params)
    end

    def find(params)
      Conversion.find_by(params)
    end
  end
end