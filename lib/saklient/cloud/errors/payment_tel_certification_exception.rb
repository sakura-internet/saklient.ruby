# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_payment_required_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. 電話認証を先に実行してください.
      class PaymentTelCertificationException < Saklient::Errors::HttpPaymentRequiredException

        # (static var) @@default_message = '要求を受け付けできません。電話認証を先に実行してください。'

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
