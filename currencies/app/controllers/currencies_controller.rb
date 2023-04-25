# frozen_string_literal: true
class CurrenciesController < ApplicationController
  def index
    render json: Currency::AvailableCurrencies.call
  end

  def convert
    render json: Currency::Converter.call(params[:amount], params[:from], params[:to])
  end
end
