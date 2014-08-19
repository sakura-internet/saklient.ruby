# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Expectation Failed.
    class HttpExpectationFailedException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Expectation Failed.'

    end

  end
end
