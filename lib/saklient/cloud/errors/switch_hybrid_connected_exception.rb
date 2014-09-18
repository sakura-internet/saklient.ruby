# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. ハイブリッド接続されているスイッチに対して, この操作はできません.
      class SwitchHybridConnectedException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。ハイブリッド接続されているスイッチに対して、この操作はできません。' : message)
        end

      end

    end
  end
end
