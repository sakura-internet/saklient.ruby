# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. 電話認証を先に実行してください.
      class PaymentTelCertificationException < Saclient::Cloud::Errors::HttpPaymentRequiredException

        # (static var) @@default_message = '要求を受け付けできません。電話認証を先に実行してください。'

      end

    end
  end
end
