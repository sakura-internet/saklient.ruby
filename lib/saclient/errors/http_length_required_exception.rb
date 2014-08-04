# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Length Required.
    class HttpLengthRequiredException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Length Required.'

    end

  end
end
