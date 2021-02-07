# frozen_string_literal: true

# TODO: Should add sorting by completedAt
module SmashGg
  module ApiQueries
    class EventById
      def call(event_id:, per_page: 100)
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
