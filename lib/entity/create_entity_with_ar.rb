# frozen_string_literal: true

module Entity
  class CreateEntityWithAr
    def initialize(entity:)
      @entity = entity
    end

    def entities(data)
      data.map { |datum| entity(datum) }
    end

    def entity(datum)
      @entity.from_ar(datum: datum)
    end
  end
end
