# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Request Entity Too Large.
    class HttpRequestEntityTooLargeException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? 'HTTPエラー。Request Entity Too Large.' : message)
      end

    end

  end
end
