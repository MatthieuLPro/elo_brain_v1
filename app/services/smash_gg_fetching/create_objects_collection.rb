# frozen_string_literal: true

module SmashGgFetching
  class CreateObjectsCollection
    def call(collection_type:, query_result:)
      collection_type.format(smash_gg_data: query_result)
    end
  end
end
