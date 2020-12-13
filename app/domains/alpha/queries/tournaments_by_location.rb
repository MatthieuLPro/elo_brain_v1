# frozen_string_literal: true

module Alpha
  module Queries
    class TournamentsByLocation
      def call(per_page:, coordinates:, radius:)
        "{
          tournaments(query: {
            perPage: #{per_page}
            filter: {
              location: {
                distanceFrom: \"#{coordinates}\",
                distance: \"#{radius}\"
              }
            }
          }) {
            nodes {
              id
              name
              city
            }
          }
        }"
      end
    end
  end
end
