# frozen_string_literal: true

module Collection
  class LaunchFormatWithData
    def call(collection_type:, data:)
      collection_type.format(api_data: data)
    end
  end
end
