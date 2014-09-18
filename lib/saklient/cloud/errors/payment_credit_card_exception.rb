# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_payment_required_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. クレジットカードの使用期限, 利用限度額をご確認ください.
      class PaymentCreditCardException < Saklient::Errors::HttpPaymentRequiredException

        # (static var) @@default_message = '要求を受け付けできません。クレジットカードの使用期限、利用限度額をご確認ください。'

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
