# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/http_forbidden_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. ゾーンをまたぐ一部のリソースは課金対象です. 料金をご確認の上, 他のゾーンで作成してください.
      class DontCreateInSandboxException < Saklient::Errors::HttpForbiddenException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作は許可されていません。ゾーンをまたぐ一部のリソースは課金対象です。料金をご確認の上、他のゾーンで作成してください。' : message)
        end

      end

    end
  end
end
