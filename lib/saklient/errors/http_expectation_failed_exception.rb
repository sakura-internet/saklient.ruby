# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Expectation Failed.
    class HttpExpectationFailedException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Expectation Failed.'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
