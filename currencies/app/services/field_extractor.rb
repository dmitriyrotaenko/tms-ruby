class FieldExtractor < ApplicationService
  def call(params)
    obj = params[:obj]
    field = params[:field]

    obj.each do |key, value|
      if value.is_a? Hash
        return call({ obj: value, field: field })
      elsif key.to_s == field
        return obj[key]
      end
    end
  end
end