# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative 'http_exception'

module Saklient
  module Errors

    # 要求された操作を行えません. 現在の対象の状態では, この操作を受け付けできません.
    class HttpConflictException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。現在の対象の状態では、この操作を受け付けできません。' : message)
      end

    end

  end
end
