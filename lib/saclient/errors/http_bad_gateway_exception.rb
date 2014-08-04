# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Bad Gateway.
    class HttpBadGatewayException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Bad Gateway.'

    end

  end
end
