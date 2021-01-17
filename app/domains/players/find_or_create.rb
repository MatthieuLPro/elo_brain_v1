# frozen_string_literal: true

module Players
  class FindOrCreate
    DEFAULT_REPOSITORY = PlayersRepo.new
    def initialize(repository: DEFAULT_REPOSITORY)
      @repository = repository
    end

    def call(name:)
      @repository.find_by(name: name) || @repository.create_with(name: name)
    end
  end
end
