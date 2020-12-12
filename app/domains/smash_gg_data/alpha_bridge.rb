# frozen_string_literal: true

module SmashGgData
  class AlphaBridge
    include Dry::Monads[:result, :try]

    def initialize(base_url: ENV['SMASH_GG_API_URL'], token: ENV['SMASH_GG_TOKEN'])
      @base_url = base_url
      @token = token
    end

    def run_now(**params)
      execute_request { post(@base_url, params.to_json) }
    end

    private

    def execute_request
      Try[HTTParty::Error] { yield }.then { |request| extract_body(request) }
    end

    def post(uri, body)
      HTTParty.post(uri, headers: headers, body: body)
    end

    def get(uri)
      HTTParty.post(uri, headers: headers)
    end

    def headers
      {
        'Authorization' => "Bearer #{@token}",
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    end

    def wrap_result(result)
      if (200..300).cover?(result.code)
        Success(result)
      else
        Failure(result)
      end
    end

    def extract_body(request)
      request.to_result
             .bind { |response| wrap_result(response) }
             .fmap { |response| JSON.parse(response.body) }
    end
  end
end
