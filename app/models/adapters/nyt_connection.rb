module Adapters
  class NytConnection
    include HTTParty

    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def query(query = {})
      results = connection.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=#{ENV["NYT_SEARCH_KEY"]}", {query: query})
      s_results = RecursiveOpenStruct.new(results, :recurse_over_arrays => true)
    end

  end
end