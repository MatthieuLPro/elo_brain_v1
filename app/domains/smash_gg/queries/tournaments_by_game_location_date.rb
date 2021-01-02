# frozen_string_literal: true

module SmashGg
  module Queries
    class TournamentsByGameLocationDate
      def call(params:)
        "{
          tournaments(query: {
            perPage: #{params.per_page}
            filter: {
              location: {
                distanceFrom: \"#{params.area.coordinates}\",
                distance: \"#{params.area.radius}\"
              },
              afterDate: #{params.dates_range.after_date},
              beforeDate: #{params.dates_range.before_date},
              videogameIds: #{params.game.id}
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
