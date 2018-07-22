# frozen_string_literal: true

require 'tinderb'

module Tinderb
  class Client
    def initialize
    end

    def params(facebook_token: nil, facebook_id: nil)
      {
        facebook_token: ENV.fetch('FACEBOOK_TOKEN', facebook_token),
        facebook_id: ENV.fetch('FACEBOOK_ID', facebook_id)
      }
    end
  end
end
