# frozen_string_literal: true

module JSON
  class KeySearcher
    def initialize(json:)
      @json = json
      @json_class = json.class
    end

    def call(key:)
      call_method_depending_of_class(@json, @json_class, key)
    end

    private

    def from_hash(hash, searched_key)
      hash.keys.each do |key|
        object = hash[key]
        return object if key == searched_key

        value = call_method_depending_of_class(object, object.class, searched_key)

        return value unless value.nil?
      end
      nil
    end

    def from_array(array, searched_key)
      array.each do |object|
        value = call_method_depending_of_class(object, object.class, searched_key)

        return value unless value.nil?
      end
      nil
    end

    def call_method_depending_of_class(object, object_class, searched_key)
      return from_hash(object, searched_key) if object_class == Hash

      return from_array(object, searched_key) if object_class == Array

      nil
    end
  end
end
