class JokesController < ApplicationController

  def random
    category = params[:category]
    return random_by_category(category) if category.presence

    render json: Joke.pluck(:text).sample
  end

  def categories
    render json: Category.pluck(:name)
  end

  def search
    query = params[:query]
    render json: Joke.where("text LIKE ?", "%#{query}%")
  end

  private

  def random_by_category(category)
    render json: Joke.where(:category_id => Category.where(:name => category)).pluck(:text).sample
  end
end