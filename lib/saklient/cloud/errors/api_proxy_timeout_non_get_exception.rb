# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_gateway_timeout_exception'

module Saklient
  module Cloud
    module Errors

      # APIプロクシが応答しません. 要求は実行された可能性があります. しばらく時間をおいてからご確認ください.
      class ApiProxyTimeoutNonGetException < Saklient::Errors::HttpGatewayTimeoutException

        # (static var) @@default_message = 'APIプロクシが応答しません。要求は実行された可能性があります。しばらく時間をおいてからご確認ください。'

      end

    end
  end
end
