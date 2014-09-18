# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Gateway Timeout.
    class HttpGatewayTimeoutException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Gateway Timeout.'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
