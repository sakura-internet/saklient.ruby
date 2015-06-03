# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Locked.
    class HttpLockedException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? 'HTTPエラー。Locked.' : message)
      end

    end

  end
end
