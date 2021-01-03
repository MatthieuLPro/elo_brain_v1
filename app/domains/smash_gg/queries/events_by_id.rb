# frozen_string_literal: true

# TODO: Should add sorting by completedAt
module SmashGg
  module Queries
    class EventsById
      def call(params:)
        "{
            event(id: #{params.id.number}){
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
