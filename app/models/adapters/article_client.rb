module Adapters
  class ArticleClient
    def connection
      @connection = Adapters::NytConnection.new
    end

    def search(term)
      results = connection.query(q: term)
      articles = results.response.docs
      articles.map do |article_struct|
        article_title = article_struct.headline.main
        article_link = article_struct.web_url
        Resource.new(title: article_title, link: article_link)
      end
    end

  end
end