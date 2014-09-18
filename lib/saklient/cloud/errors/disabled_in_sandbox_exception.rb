# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_forbidden_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. このゾーンではこの操作は禁止されています. 他のゾーンでお試しください.
      class DisabledInSandboxException < Saklient::Errors::HttpForbiddenException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作は許可されていません。このゾーンではこの操作は禁止されています。他のゾーンでお試しください。' : message)
        end

      end

    end
  end
end
