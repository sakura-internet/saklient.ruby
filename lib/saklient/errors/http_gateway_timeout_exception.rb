# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Gateway Timeout.
    class HttpGatewayTimeoutException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Gateway Timeout.'

    end

  end
end
