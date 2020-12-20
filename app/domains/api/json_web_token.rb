# frozen_string_literal: true

module Api
  class JsonWebToken
    def encode(data:)
      JWT.encode({ data: data, iss: ENV['API_ISS'], aud: ENV['API_AUD'] }, ENV['HMAC_SECRET'], 'HS256')
    end

    def call(token:)
      JWT.decode(
        token,
        ENV['HMAC_SECRET'],
        true,
        {
          iss: ENV['API_ISS'],
          verify_iss: true,
          aud: ENV['API_AUD'],
          verify_aud: true,
          algorithm: 'HS256'
        }
      )
    end
  end
end
