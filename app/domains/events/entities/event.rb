# frozen_string_literal: true

module Events
  module Entities
    class Event < Dry::Struct
      attribute :id, Types::Strict::Integer
      attribute :number_entrants, Types::Strict::Integer
      attribute :matches, Types::Strict::Array

      # We do not use the method .from_contract because
      # the values come from api request
      # SmashGg oriented ==> Should rename by from_smash_gg?
      def self.from_json(event)
        new(
          id: event['id'],
          number_entrants: event['numEntrants'],
          matches: event['sets']['nodes']
        )
      end
    end
  end
end
