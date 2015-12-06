module Adapters
  class ArticleClient
    def connection
      @connection = Adapters::NytConnection.new
    end

    def find_by_name(name)
      results = connection.query(q: name)
      binding.pry
    end

  end
end