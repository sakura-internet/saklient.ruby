# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Gateway Timeout.
      class HttpGatewayTimeoutException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Gateway Timeout.'

      end

    end
  end
end
