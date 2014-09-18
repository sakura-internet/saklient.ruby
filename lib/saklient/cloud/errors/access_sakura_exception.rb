# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_forbidden_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. さくらインターネットの会員メニューより認証後に実行してください.
      class AccessSakuraException < Saklient::Errors::HttpForbiddenException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作は許可されていません。さくらインターネットの会員メニューより認証後に実行してください。' : message)
        end

      end

    end
  end
end
