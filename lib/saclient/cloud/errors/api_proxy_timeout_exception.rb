# -*- encoding: UTF-8 -*-

require_relative 'http_gateway_timeout_exception'

module Saclient
  module Cloud
    module Errors

      # APIプロクシがタイムアウトしました. サーバが混雑している可能性があります.
      class ApiProxyTimeoutException < Saclient::Cloud::Errors::HttpGatewayTimeoutException

        # (static var) @@default_message = 'APIプロクシがタイムアウトしました。サーバが混雑している可能性があります。'

      end

    end
  end
end
