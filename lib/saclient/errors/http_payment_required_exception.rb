# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Payment Required.
    class HttpPaymentRequiredException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Payment Required.'

    end

  end
end
