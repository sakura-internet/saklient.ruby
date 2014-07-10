# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # お客様のご都合により操作を受け付けることができません.
      class PaymentPaymentException < Saclient::Cloud::Errors::HttpPaymentRequiredException

        # (static var) @@default_message = 'お客様のご都合により操作を受け付けることができません。'

      end

    end
  end
end