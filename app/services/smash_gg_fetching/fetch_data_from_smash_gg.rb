# frozen_string_literal: true

module SmashGgFetching
  class FetchDataFromSmashGg
    def call(query:)
      parameter = SmashGgData::AlphaParameter.new(query: query, operation_name: nil, variables: nil)
      SmashGgData::AlphaFacade.new.run_alpha_end_point(parameter: parameter)
    end
  end
end
