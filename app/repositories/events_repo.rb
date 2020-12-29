# frozen_string_literal: true

class EventsRepo
  def index
    Events.all
  end
end
