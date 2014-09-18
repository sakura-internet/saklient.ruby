# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Payment Required.
    class HttpPaymentRequiredException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Payment Required.'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
