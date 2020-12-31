# frozen_string_literal: true

class EventsRepo
  def index
    Event.all
  end

  def create_by(name:)
    Event.create(name: name)
  end
end
