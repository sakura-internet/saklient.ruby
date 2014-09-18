# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Not Extended.
    class HttpNotExtendedException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? 'HTTPエラー。Not Extended.' : message)
      end

    end

  end
end
