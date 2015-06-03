# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/http_forbidden_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. XHRまたはAPIキーによるアクセスのみ許可されています.
      class AccessXhrOrApiKeyException < Saklient::Errors::HttpForbiddenException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作は許可されていません。XHRまたはAPIキーによるアクセスのみ許可されています。' : message)
        end

      end

    end
  end
end
