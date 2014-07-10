# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Bad Gateway.
      class HttpBadGatewayException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Bad Gateway.'

      end

    end
  end
end
