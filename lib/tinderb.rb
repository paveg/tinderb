# frozen_string_literal: true

require 'tinderb/version'
require 'tinderb/errors'
require 'tinderb/client'

module Tinderb
  API_ENDPOINT = 'https://api.gotinder.com'
  OAUTH_PATH = "#{API_ENDPOINT}/auth"
end
