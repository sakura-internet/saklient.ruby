# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_payment_required_exception'

module Saklient
  module Cloud
    module Errors

      # お客様のご都合により操作を受け付けることができません.
      class PaymentPaymentException < Saklient::Errors::HttpPaymentRequiredException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? 'お客様のご都合により操作を受け付けることができません。' : message)
        end

      end

    end
  end
end
