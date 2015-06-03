# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/http_payment_required_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. 支払情報が未登録です. 会員メニューから支払, クレジットカードの情報を登録してください
      class PaymentRegistrationException < Saklient::Errors::HttpPaymentRequiredException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求を受け付けできません。支払情報が未登録です。会員メニューから支払、クレジットカードの情報を登録してください' : message)
        end

      end

    end
  end
end
