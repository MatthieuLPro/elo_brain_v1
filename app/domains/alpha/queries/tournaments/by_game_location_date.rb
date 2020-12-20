# frozen_string_literal: true

module Alpha
  module Queries
    module Tournaments
      class ByGameLocationDate
        def call(params:)
          "{
            tournaments(query: {
              perPage: #{params.per_page}
              filter: {
                location: {
                  distanceFrom: \"#{params.coordinates}\",
                  distance: \"#{params.radius}\"
                },
                afterDate: #{params.after_date},
                beforeDate: #{params.before_date},
                videogameIds: #{params.video_game_id}
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
end
