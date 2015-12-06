class QueriesController < ApplicationController

  def create
    term = params[:q]
    articles = Adapters::ArticleClient.new.search(term)
    render json: articles
  end

end