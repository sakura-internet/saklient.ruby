# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_payment_required_exception'

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. クレジットカードの使用期限, 利用限度額をご確認ください.
      class PaymentCreditCardException < Saclient::Errors::HttpPaymentRequiredException

        # (static var) @@default_message = '要求を受け付けできません。クレジットカードの使用期限、利用限度額をご確認ください。'

      end

    end
  end
end
