# frozen_string_literal: true

require 'tinderb'
require 'tinderb/request'

module Tinderb
  class Client
    include Request

    def initialize(facebook_token: nil, facebook_id: nil)
      @oauth_params = params(facebook_token, facebook_id)
    end

    def params(facebook_token, facebook_id)
      {
        facebook_token: ENV.fetch('FACEBOOK_TOKEN', facebook_token),
        facebook_id: ENV.fetch('FACEBOOK_ID', facebook_id)
      }
    end

    def authorize
      res = post(OAUTH_PATH, @oauth_params)
      raise "error occurred. body: #{res.body}" unless res.status == 200
      @token = res.body['token']

      res
    end
  end
end
