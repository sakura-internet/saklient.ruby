# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. アカウントあたりの全サーバメモリサイズ上限により, リソースの割り当てに失敗しました.
      class LimitMemoryInAccountException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求を受け付けできません。アカウントあたりの全サーバメモリサイズ上限により、リソースの割り当てに失敗しました。'

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
