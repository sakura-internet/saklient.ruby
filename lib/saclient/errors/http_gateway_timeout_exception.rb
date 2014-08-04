# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Gateway Timeout.
    class HttpGatewayTimeoutException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Gateway Timeout.'

    end

  end
end
