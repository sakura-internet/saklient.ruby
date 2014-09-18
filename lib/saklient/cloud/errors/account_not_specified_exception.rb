# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_forbidden_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. このAPIはアカウントを特定できる認証方法でアクセスする必要があります.
      class AccountNotSpecifiedException < Saklient::Errors::HttpForbiddenException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作は許可されていません。このAPIはアカウントを特定できる認証方法でアクセスする必要があります。' : message)
        end

      end

    end
  end
end
