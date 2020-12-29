# frozen_string_literal: true

# TODO: Remove those functions into repositories file
module Events
  class EventRepository
    def create(name:)
      ::Event.create(name: name)
    end
  end
end
