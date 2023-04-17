module Currency
  class Converter < ApplicationService
    def call(params)
      # remove to_f
      (params[:amount].to_f * params[:rate].to_f).round(2)
    end
  end
end
