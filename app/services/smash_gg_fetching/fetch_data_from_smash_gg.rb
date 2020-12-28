# frozen_string_literal: true

module SmashGgFetching
  class FetchDataFromSmashGg
    def call(query:)
      SmashGgData::AlphaFacade.new.run_alpha_end_point(
        parameter: SmashGgData::AlphaParameter.new(query: query, operation_name: nil, variables: nil)
      )
    end
  end
end
