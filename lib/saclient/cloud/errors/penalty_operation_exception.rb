# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_payment_required_exception'

module Saclient
  module Cloud
    module Errors

      # お客様のご都合により操作を受け付けることができません.
      class PenaltyOperationException < Saclient::Errors::HttpPaymentRequiredException

        # (static var) @@default_message = 'お客様のご都合により操作を受け付けることができません。'

      end

    end
  end
end
