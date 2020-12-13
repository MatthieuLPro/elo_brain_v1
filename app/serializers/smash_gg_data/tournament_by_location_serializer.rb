# frozen_string_literal: true

module SmashGgData
  class TournamentByLocationSerializer
    def serialize(tournaments_collection:)
      tournaments_collection.map do |tournament|
        {
          name: tournament.name,
          city: tournament.city
        }
      end
    end
  end
end
