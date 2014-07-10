# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Payment Required.
      class HttpPaymentRequiredException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Payment Required.'

      end

    end
  end
end
