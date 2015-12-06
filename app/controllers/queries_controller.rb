class QueriesController < ApplicationController

  def create
    term = params[:q]
    articles = Adapters::ArticleClient.new.search(term)
    article_list = articles.map do |article|
      render_to_string(partial: "groups/query_results", locals: {article: article})
    end.join()
    render json: {article_list: article_list}
  end

end