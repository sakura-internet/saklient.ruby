# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_payment_required_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. 支払情報が未登録です. 会員メニューから支払, クレジットカードの情報を登録してください
      class PaymentRegistrationException < Saklient::Errors::HttpPaymentRequiredException

        # (static var) @@default_message = '要求を受け付けできません。支払情報が未登録です。会員メニューから支払、クレジットカードの情報を登録してください'

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
