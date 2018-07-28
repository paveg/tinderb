module Tinderb
  class Errors
    class InternalServerError < RuntimeError; end # 500
    class NotFound < StandardError; end #404
    class Unauthorized < StandardError; end # 401
    class BadRequest < StandardError; end # 400
    class MovedPermanently < StandardError; end # 301
  end
end
