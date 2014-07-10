# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Expectation Failed.
      class HttpExpectationFailedException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Expectation Failed.'

      end

    end
  end
end
