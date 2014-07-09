# -*- encoding: UTF-8 -*-

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
