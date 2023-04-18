# frozen_string_literal: true
class CurrenciesController < ApplicationController
  def index
    render json: Currency::AvailableCurrencies.call
  end

  def convert
    render json: Currency::Converter.call({
      amount: params[:amount],
      rate: Currency::Rate.call({ from: params[:from], to: params[:to] })
    })
  end
end
