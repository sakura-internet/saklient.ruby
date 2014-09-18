# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_gateway_timeout_exception'

module Saklient
  module Cloud
    module Errors

      # APIプロクシが応答しません. 要求は実行された可能性があります. しばらく時間をおいてからご確認ください.
      class ApiProxyTimeoutNonGetException < Saklient::Errors::HttpGatewayTimeoutException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? 'APIプロクシが応答しません。要求は実行された可能性があります。しばらく時間をおいてからご確認ください。' : message)
        end

      end

    end
  end
end
