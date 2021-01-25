# frozen_string_literal: true

# TODO: Should add sorting by completedAt
module SmashGgv2
  module ApiQueries
    class EventById
      def call(per_page: 100, event_id:)
        "{
            event(id: #{event_id}){
              id
              name
              numEntrants
              sets(
                    perPage: #{per_page}
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
