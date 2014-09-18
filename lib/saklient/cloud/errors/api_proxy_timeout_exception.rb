# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_gateway_timeout_exception'

module Saklient
  module Cloud
    module Errors

      # APIプロクシがタイムアウトしました. サーバが混雑している可能性があります.
      class ApiProxyTimeoutException < Saklient::Errors::HttpGatewayTimeoutException

        # (static var) @@default_message = 'APIプロクシがタイムアウトしました。サーバが混雑している可能性があります。'

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, message)
        end

      end

    end
  end
end
