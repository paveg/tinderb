# frozen_string_literal: true

require 'tinderb'
require 'tinderb/request'
require 'tinderb/errors'
module Tinderb
  class Client
    include Request

    def initialize(facebook_token:, facebook_id: nil)
      @oauth_params = params(facebook_token, facebook_id)
    end

    def params(facebook_token, facebook_id)
      {
        facebook_token: facebook_token,
        facebook_id: ENV.fetch('FACEBOOK_ID', facebook_id)
      }
    end

    def authorize
      res = post(OAUTH_PATH, @oauth_params)
      classify_error(res)
      @token = res.body['token']

      res
    end

    private

    def classify_error(res)
      error = case res.status
              when 200
              when 301
                Tinderb::Errors::MovedPermanently
              when 400
                Tinderb::Errors::BadRequest
              when 401
                Tinderb::Errors::Unauthorized
              when 404
                Tinderb::Errors::NotFound
              when 500
                Tinderb::Errors::InternalServerError
              end
      body = res.body
      raise error.new("#{body['error']}, error_no: #{body['error_no']}") unless res.status == 200
    end
  end
end
