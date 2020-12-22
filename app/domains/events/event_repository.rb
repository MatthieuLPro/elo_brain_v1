# frozen_string_literal: true

module Events
  class EventRepository
    def create(name:)
      ::Event.create(name: name)
    end
  end
end
