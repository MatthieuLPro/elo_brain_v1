# frozen_string_literal: true

# TODO: Should find a better module naming
module Collection
  class LaunchFormatWithData
    def call(collection_type:, data:)
      collection_type.format(api_data: data)
    end
  end
end
