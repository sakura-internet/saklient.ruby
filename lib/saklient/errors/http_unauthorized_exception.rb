# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # この操作は認証が必要です. IDまたはパスワードが誤っている可能性があります.
    class HttpUnauthorizedException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'この操作は認証が必要です。IDまたはパスワードが誤っている可能性があります。'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
