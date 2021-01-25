# frozen_string_literal: true

module SmashGgv2
  module ApiQueries
    class TournamentsByGameLocationDate
      def call(per_page: 100, area:, dates_range:, game:)
        "{
          tournaments(query: {
            perPage: #{per_page}
            filter: {
              location: {
                distanceFrom: \"#{area.coordinates}\",
                distance: \"#{area.radius}\"
              },
              afterDate: #{dates_range.after_date},
              beforeDate: #{dates_range.before_date},
              videogameIds: #{game.id}
            }
          })
          {
            nodes {
              id
              name
              city
              startAt
              events {
                id
                numEntrants
                videogame {
                  id
                  name
                }
              }
            }
          }
        }"
      end
    end
  end
end
