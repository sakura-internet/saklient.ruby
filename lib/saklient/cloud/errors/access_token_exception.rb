# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_forbidden_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. この操作は有効期限内のトークンが必要です.
      class AccessTokenException < Saklient::Errors::HttpForbiddenException

        # (static var) @@default_message = '要求された操作は許可されていません。この操作は有効期限内のトークンが必要です。'

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, message)
        end

      end

    end
  end
end
