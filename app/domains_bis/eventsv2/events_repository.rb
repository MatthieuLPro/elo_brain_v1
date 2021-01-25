# frozen_string_literal: true

module Eventsv2
  class EventsRepository
    def from_smash_gg(query:)
      event = ExternalApi::Facades::SmashGg.new.run_alpha_end_point(
        parameter: SmashGgv2::ApiParameters::Entity.new(query: query, operation_name: nil, variables: nil)
      )
      event = event.flatten.dig('data', 'event')
      event = {
        id: event['id'],
        number_entrants: event['numEntrants'],
        matches: event['sets']['nodes']
      }
      # Condition : Return if no match is played
      return unless event[:matches]

      entity(event)
    end

    private

    def entity(event)
      Eventsv2::Entity.new(id: event[:id], number_entrants: event[:number_entrants], matches: event[:matches])
    end
  end
end
