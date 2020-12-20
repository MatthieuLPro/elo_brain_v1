# frozen_string_literal: true

module Alpha
  module Queries
    module Events
      class ById
        def call(params:)
          "{
              event(id: #{params.id}){
                id
                name
                numEntrants
                sets(
                      perPage: #{params.per_page}
                    ) {
                      nodes {
                        displayScore
                        completedAt
                      }
                    }
              }
            }"
        end
      end
    end
  end
end
