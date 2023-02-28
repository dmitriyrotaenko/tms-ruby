class JokesController < ApplicationController
  BASE_URL = 'https://api.chucknorris.io'.freeze
  def random
    category = params['category']
    if category.presence
      random_by_category(category)
    else
      render json: fetch_data('/jokes/random')['value']
    end
  end

  def categories
    render json: fetch_data('/jokes/categories')
  end

  def random_by_category(category)
    render json: fetch_data("/jokes/random?category=#{category}")['value']
  end

  def search
    query = params['query']
    render json: fetch_data("/jokes/search?query=#{query}")
  end

  def fetch_data(url)
    JSON(HTTP.get("#{BASE_URL}#{url}"))
  end
end