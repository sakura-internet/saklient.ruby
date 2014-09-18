# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # この操作は認証が必要です. IDまたはパスワードが誤っている可能性があります.
    class HttpUnauthorizedException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? 'この操作は認証が必要です。IDまたはパスワードが誤っている可能性があります。' : message)
      end

    end

  end
end
