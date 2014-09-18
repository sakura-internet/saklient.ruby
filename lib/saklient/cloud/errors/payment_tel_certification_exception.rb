# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_payment_required_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. 電話認証を先に実行してください.
      class PaymentTelCertificationException < Saklient::Errors::HttpPaymentRequiredException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求を受け付けできません。電話認証を先に実行してください。' : message)
        end

      end

    end
  end
end
