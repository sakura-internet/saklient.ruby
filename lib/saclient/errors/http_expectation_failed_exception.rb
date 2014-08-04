# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Expectation Failed.
    class HttpExpectationFailedException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Expectation Failed.'

    end

  end
end
