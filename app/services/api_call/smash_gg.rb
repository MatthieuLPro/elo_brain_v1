# frozen_string_literal: true

module ApiCall
  class SmashGg
    def call(query:)
      ExternalApi::Facades::SmashGg.new.run_alpha_end_point(
        parameter: ExternalApi::Entities::SmashGgParameter.new(query: query, operation_name: nil, variables: nil)
      )
    end
  end
end
