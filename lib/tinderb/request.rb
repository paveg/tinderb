# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Faraday
  class Request
    class TinderbOauth2 < Middleware
      def initialize(app, token)
        @app = app
        @token = token
      end

      def call(env)
        env[:request_headers]['X-Auth-Token'] ||= @token
        @app.call(env)
      end
    end
    register_middleware tinderb_oauth2: TinderbOauth2
  end
end

module Tinderb
  module Request
    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, params = {})
      request(:post, path, params)
    end

    def put(path, params = {})
      request(:put, path, params)
    end

    def delete(path, params = {})
      request(:delete, path, params)
    end

    private

    def request(method, path, params = {})
      connection.send(method.to_sym, path, params).env
    rescue Faraday::Error::ClientError
      raise 'client error'
    end

    def connection
      return @connection if instance_variable_defined?(:@connection) && @connection.headers.key?('X-Auth-Token')

      @connection = Faraday.new(Tinderb::API_ENDPOINT) do |conn|
        conn.request :tinderb_oauth2, @token if @token
        conn.request :url_encoded
        conn.request :json
        assigne_header(conn)
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end

    def assigne_header(conn)
      conn.headers['User-agent'] ||= 'Tinder/7.5.3 (iPhone; iOS 10.3.2; Scale/2.00)'
      conn.headers['Content-type'] ||= 'application/json'
    end
  end
end
