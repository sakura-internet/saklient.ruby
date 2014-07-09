# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. 支払情報が未登録です. 会員メニューから支払, クレジットカードの情報を登録してください
      class PaymentRegistrationException < Saclient::Cloud::Errors::HttpPaymentRequiredException

        # (static var) @@default_message = '要求を受け付けできません。支払情報が未登録です。会員メニューから支払、クレジットカードの情報を登録してください'

      end

    end
  end
end
