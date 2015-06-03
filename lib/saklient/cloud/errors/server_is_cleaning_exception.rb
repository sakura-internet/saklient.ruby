# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. サーバが終了処理中です. しばらく時間をおいてから再度お試しください.
      class ServerIsCleaningException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。サーバが終了処理中です。しばらく時間をおいてから再度お試しください。' : message)
        end

      end

    end
  end
end
