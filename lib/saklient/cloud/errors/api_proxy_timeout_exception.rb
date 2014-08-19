# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_gateway_timeout_exception'

module Saklient
  module Cloud
    module Errors

      # APIプロクシがタイムアウトしました. サーバが混雑している可能性があります.
      class ApiProxyTimeoutException < Saklient::Errors::HttpGatewayTimeoutException

        # (static var) @@default_message = 'APIプロクシがタイムアウトしました。サーバが混雑している可能性があります。'

      end

    end
  end
end
