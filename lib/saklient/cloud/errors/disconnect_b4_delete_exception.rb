# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. サーバとの接続を切り離した後に実行してください.
      class DisconnectB4DeleteException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。サーバとの接続を切り離した後に実行してください。'

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
